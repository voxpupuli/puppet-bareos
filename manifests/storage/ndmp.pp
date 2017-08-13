# == Define: bareos::storage::ndmp
# The NDMP Resource speciﬁes the authentication details of each NDMP client.
# There may be multiple NDMP resources for a single Storage daemon.
# In general, the properties speciﬁed within the NDMP resource are speciﬁc to one client.
#
# == Parameters
# [*ensure*]
#   present or absent the config file.
#
# [*auth_type*]
#   Auth Type
#
#   Bareos Datatype: auth_type
#   Bareos Default: None
#   Required: false
#
# [*description*]
#   Description
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*log_level*]
#   Log Level
#
#   Bareos Datatype: pint32
#   Bareos Default: 4
#   Required: false
#
# [*password*]
#   Password
#
#   Bareos Datatype: autopassword
#   Bareos Default: Not set
#   Required: true
#
# [*username*]
#   Username
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: true
#
define bareos::storage::ndmp (
  $ensure = present,
  $auth_type = undef,
  $description = undef,
  $log_level = undef,
  $password = undef,
  $username = undef,
) {
  include ::bareos::storage

  $_resource = 'Ndmp'
  $_resource_dir = 'ndmp'

  unless $ensure in [ 'present', 'absent' ] {
    fail('Invalid value for ensure')
  }

  if $ensure == 'present' {
    unless $auth_type == undef or downcase($auth_type) in [ 'none', 'clear', 'md5' ] {
      fail("Invalid value for auth_type: ${auth_type}")
    }
    $_settings = bareos_settings(
      [$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$auth_type, 'Auth Type', 'type', false],
      [$log_level, 'Log Level', 'pint32', false],
      [$password, 'Password', 'autopassword', true],
      [$username, 'Username', 'string', true]
    )
  }

  file { "${::bareos::storage::config_dir}/${_resource_dir}/${name}.conf":
    ensure  => $ensure,
    mode    => $::bareos::file_mode,
    owner   => $::bareos::file_owner,
    group   => $::bareos::file_group,
    content => template('bareos/resource.erb'),
    notify  => Service[$::bareos::storage::service_name],
  }
}
