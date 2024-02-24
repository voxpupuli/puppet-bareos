# @summary 
#   The NDMP Resource specifies the authentication details of each NDMP client. There may be multiple NDMP resources for a single Storage daemon. In general, the properties specified within the NDMP resource are specific to one client.
#
# @param ensure
#   present or absent the config file.
# @param auth_type
#   Auth Type
#
#   Bareos Datatype: auth_type
#   Bareos Default: None
#   Required: false
#
# @param description
#   Description
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# @param log_level
#   Log Level
#
#   Bareos Datatype: pint32
#   Bareos Default: 4
#   Required: false
#
# @param password
#   Password
#
#   Bareos Datatype: autopassword
#   Bareos Default: Not set
#   Required: true
#
# @param username
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
  include bareos::storage

  $_resource = 'Ndmp'
  $_resource_dir = 'ndmp'

  unless $ensure in ['present', 'absent'] {
    fail('Invalid value for ensure')
  }

  if $ensure == 'present' {
    $_settings = bareos_settings([$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$auth_type, 'Auth Type', 'auth_type', false],
      [$log_level, 'Log Level', 'pint32', false],
      [$password, 'Password', 'autopassword', true],
      [$username, 'Username', 'string', true]
    )
  }

  file { "${bareos::storage::config_dir}/${_resource_dir}/${name}.conf":
    ensure  => $ensure,
    mode    => $bareos::file_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    content => template('bareos/resource.erb'),
    notify  => Service[$bareos::storage::service_name],
    tag     => ['bareos', 'bareos_storage'],
  }
}
