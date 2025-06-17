# @summary 
#   Provides a means of automatically scheduling a job as well as the ability to override the default level, pool, storage and messages resources. If a schedule resource is not referenced in a job, the jjob can only be run manually. In general, you specify an action to be taken and when.
#
# @param ensure
#   present or absent the config file.
#
# @param description
#   Description
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# @param enabled
#   Enabled: En- or disable this resource.
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# @param run
#   Run
#
#   May be specified as Array.
#   Bareos Datatype: schedule_run_command
#   Bareos Default: Not set
#   Required: false
#
define bareos::director::schedule (
  Enum['present','absent'] $ensure = present,
  $description = undef,
  $enabled = undef,
  $run = undef,
) {
  include bareos::director

  $_resource = 'Schedule'
  $_resource_dir = 'schedule'

  if $ensure == 'present' {
    $_settings = bareos_settings([$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$enabled, 'Enabled', 'boolean', false],
      [$run, 'Run', 'schedule_run_command_list', false]
    )
  }

  file { "${bareos::director::config_dir}/${_resource_dir}/${name}.conf":
    ensure  => $ensure,
    mode    => $bareos::file_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    content => template('bareos/resource.erb'),
    notify  => Service[$bareos::director::service_name],
    tag     => ['bareos', 'bareos_director'],
  }
}
