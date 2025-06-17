# @summary
#   Supports single or multiple drive autochangers by grouping one or more device resources into one unit called an autochanger in Bareos (often referred to as a "tape library" by autochanger manufacturers).
#
# @param ensure
#   present or absent the config file.
#
# @param changer_command
#   Changer Command
#
#   Bareos Datatype: strname
#   Bareos Default: Not set
#   Required: true
#
# @param changer_device
#   Changer Device
#
#   Bareos Datatype: strname
#   Bareos Default: Not set
#   Required: true
#
# @param description
#   Description
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# @param device
#   Device
#
#   May be specified as Array.
#   Bareos Datatype: resource_list
#   Bareos Default: Not set
#   Required: true
#
define bareos::storage::autochanger (
  Enum['present','absent'] $ensure = present,
  $changer_command = undef,
  $changer_device = undef,
  $description = undef,
  $device = undef,
) {
  include bareos::storage

  $_resource = 'Autochanger'
  $_resource_dir = 'autochanger'

  if $ensure == 'present' {
    $_require_resource = [
      Bareos::Storage::Device[$device],
    ]
    $_settings = bareos_settings([$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$changer_command, 'Changer Command', 'strname', true],
      [$changer_device, 'Changer Device', 'strname', true],
      [$device, 'Device', 'resource_list', true]
    )
  } else {
    $_require_resource = undef
  }

  file { "${bareos::storage::config_dir}/${_resource_dir}/${name}.conf":
    ensure  => $ensure,
    mode    => $bareos::file_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    content => template('bareos/resource.erb'),
    notify  => Service[$bareos::storage::service_name],
    require => $_require_resource,
    tag     => ['bareos', 'bareos_storage'],
  }
}
