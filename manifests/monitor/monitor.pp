# == Define: bareos::monitor::monitor
# The Monitor resource defines the attributes of the Monitor running on the network.
# The parameters you define here must be configured as a Director resource
# in Clients and Storages configuration files, and as a Console resource in Directors configuration files.
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
# [*dir_connect_timeout*]
#   Dir Connect Timeout
#
#   Bareos Datatype: time
#   Bareos Default: 10
#   Required: false
#
# [*fd_connect_timeout*]
#   Fd Connect Timeout
#
#   Bareos Datatype: time
#   Bareos Default: 10
#   Required: false
#
# [*password*]
#   Password
#
#   Bareos Datatype: md5password
#   Bareos Default: Not set
#   Required: true
#
# [*refresh_interval*]
#   Refresh Interval
#
#   Bareos Datatype: time
#   Bareos Default: 60
#   Required: false
#
# [*require_ssl*]
#   Require Ssl
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*sd_connect_timeout*]
#   Sd Connect Timeout
#
#   Bareos Datatype: time
#   Bareos Default: 10
#   Required: false
#
define bareos::monitor::monitor (
  $ensure = present,
  $description = undef,
  $dir_connect_timeout = undef,
  $fd_connect_timeout = undef,
  $password = undef,
  $refresh_interval = undef,
  $require_ssl = undef,
  $sd_connect_timeout = undef,
) {
  include ::bareos::monitor

  $_resource = 'Monitor'
  $_resource_dir = 'monitor'

  unless $ensure in [ 'present', 'absent' ] {
    fail('Invalid value for ensure')
  }

  if $ensure == 'present' {
    $_settings = bareos_settings(
      [$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$dir_connect_timeout, 'Dir Connect Timeout', 'time', false],
      [$fd_connect_timeout, 'Fd Connect Timeout', 'time', false],
      [$password, 'Password', 'md5password', true],
      [$refresh_interval, 'Refresh Interval', 'time', false],
      [$require_ssl, 'Require Ssl', 'boolean', false],
      [$sd_connect_timeout, 'Sd Connect Timeout', 'time', false]
    )
  }

  file { "${::bareos::monitor::config_dir}/${_resource_dir}/${name}.conf":
    ensure  => $ensure,
    mode    => $bareos::file_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    content => template('bareos/resource.erb'),
    tag     => ['bareos', 'bareos_monitor'],
  }
}
