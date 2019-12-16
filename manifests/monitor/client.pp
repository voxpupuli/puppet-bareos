# == Define: bareos::monitor::client
# The Client resource defines the attributes of the Clients that are monitored by this Monitor.
#
# == Parameters
# [*ensure*]
#   present or absent the config file.
#
# [*address*]
#   Address
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: true
#
# [*description*]
#   Description
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*enable_ssl*]
#   Enable Ssl
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*fd_port*]
#   Fd Port
#
#   Bareos Datatype: pint32
#   Bareos Default: 9102
#   Required: false
#
# [*password*]
#   Password
#
#   Bareos Datatype: md5password
#   Bareos Default: Not set
#   Required: true
#
define bareos::monitor::client (
  $ensure = present,
  $address = undef,
  $description = undef,
  $enable_ssl = undef,
  $fd_port = undef,
  $password = undef,
) {
  include ::bareos::monitor

  $_resource = 'Client'
  $_resource_dir = 'client'

  unless $ensure in [ 'present', 'absent' ] {
    fail('Invalid value for ensure')
  }

  if $ensure == 'present' {
    $_settings = bareos_settings(
      [$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$address, 'Address', 'string', true],
      [$enable_ssl, 'Enable Ssl', 'boolean', false],
      [$fd_port, 'Fd Port', 'pint32', false],
      [$password, 'Password', 'md5password', true]
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
