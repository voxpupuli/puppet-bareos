# == Define: bareos::director::schedule
# The Schedule resource provides a means of automatically scheduling a Job
# as well as the ability to override the default Level, Pool, Storage and Messages resources.
# If a Schedule resource is not referenced in a Job, the Job can only be run manually.
# In general, you specify an action to be taken and when.
#
# == Parameters
# [*ensure*]
#   present or absent the config file.
#
# [*description*]
#   Description
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*enabled*]
#   Enabled: En- or disable this resource.
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*run*]
#   Run
#
#   May be specified as Array.
#   Bareos Datatype: schedule_run_command
#   Bareos Default: Not set
#   Required: false
#
define bareos::director::schedule (
  $ensure = present,
  $description = undef,
  $enabled = undef,
  $run = undef,
) {
  include ::bareos::director

  $_resource = 'Schedule'
  $_resource_dir = 'schedule'

  unless $ensure in [ 'present', 'absent' ] {
    fail('Invalid value for ensure')
  }

  if $ensure == 'present' {
    $_settings = bareos_settings(
      [$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$enabled, 'Enabled', 'boolean', false],
      [$run, 'Run', 'schedule_run_command_list', false]
    )
  }

  file { "${::bareos::director::config_dir}/${_resource_dir}/${name}.conf":
    ensure  => $ensure,
    mode    => $bareos::file_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    content => template('bareos/resource.erb'),
    notify  => Service[$bareos::director::service_name],
    tag     => ['bareos', 'bareos_director'],
  }
}
