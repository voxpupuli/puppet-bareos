# == Define: bareos::monitor::storage
# The Storage resource defines the attributes of the Storages that are monitored by this Monitor.
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
# [*password*]
#   Password
#
#   Bareos Datatype: md5password
#   Bareos Default: Not set
#   Required: true
#
# [*sd_address*]
#   Sd Address
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*sd_password*]
#   Sd Password
#
#   Bareos Datatype: md5password
#   Bareos Default: Not set
#   Required: false
#
# [*sd_port*]
#   Sd Port
#
#   Bareos Datatype: pint32
#   Bareos Default: 9103
#   Required: false
#
define bareos::monitor::storage (
  $ensure = present,
  $address = undef,
  $description = undef,
  $enable_ssl = undef,
  $password = undef,
  $sd_address = undef,
  $sd_password = undef,
  $sd_port = undef,
) {
  include ::bareos::monitor

  $_resource = 'Storage'
  $_resource_dir = 'storage'

  unless $ensure in [ 'present', 'absent' ] {
    fail('Invalid value for ensure')
  }

  if $ensure == 'present' {
    $_settings = bareos_settings(
      [$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$address, 'Address', 'string', true],
      [$enable_ssl, 'Enable Ssl', 'boolean', false],
      [$password, 'Password', 'md5password', true],
      [$sd_address, 'Sd Address', 'string', false], # alias? undocumented
      [$sd_password, 'Sd Password', 'md5password', false], # alias? undocumented
      [$sd_port, 'Sd Port', 'pint32', false]
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
