# == Define: bareos::monitor::director
# The Director resource defines the attributes of the Directors that are monitored by this Monitor.
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
# [*dir_port*]
#   Dir Port
#
#   Bareos Datatype: pint32
#   Bareos Default: 9101
#   Required: false
#
# [*enable_ssl*]
#   Enable Ssl
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
define bareos::monitor::director (
  Bareos::Module::Ensure $ensure = present,
  Optional[String] $address = undef,
  Optional[String] $description = undef,
  Optional[Stdlib::Port] $dir_port = undef,
  Optional[Bareos::Boolean] $enable_ssl = undef,
) {
  include bareos::monitor

  $_resource = 'Director'
  $_resource_dir = 'director'

  if $ensure == 'present' {
    $_settings = bareos_settings( [$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$address, 'Address', 'string', true],
      [$dir_port, 'Dir Port', 'pint32', false],
      [$enable_ssl, 'Enable Ssl', 'boolean', false]
    )
  }

  file { "${bareos::monitor::config_dir}/${_resource_dir}/${name}.conf":
    ensure  => $ensure,
    mode    => $bareos::file_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    content => template('bareos/resource.erb'),
    tag     => ['bareos', 'bareos_monitor'],
  }
}
