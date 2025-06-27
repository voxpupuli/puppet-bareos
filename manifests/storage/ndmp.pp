# @summary 
#   The NDMP Resource specifies the authentication details of each NDMP client. There may be multiple NDMP resources for a single Storage daemon. In general, the properties specified within the NDMP resource are specific to one client.
#
# @param ensure
#   present or absent the config file.
#
# @param auth_type
#   Auth Type
#
#   Bareos Datatype: auth_type
#   Bareos Default: None
#   Required: false
#
# @param description
#   Description
#   Bareos Datatype: string
#
# @param log_level
#   Log Level
#   Bareos Datatype: pint32
#
# @param password
#   Password
#   Bareos Datatype: autopassword
#
# @param username
#   Username
#   Bareos Datatype: string
#
define bareos::storage::ndmp (
  Optional[String[1]] $auth_type   = undef,
  Optional[String[1]] $password    = undef,
  Optional[String[1]] $username    = undef,
  Optional[Integer[0]] $log_level  = undef,
  Enum['present','absent'] $ensure = present,
  Optional[String[1]] $description = undef,
) {
  include bareos::storage

  $_resource = 'Ndmp'
  $_resource_dir = 'ndmp'

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
