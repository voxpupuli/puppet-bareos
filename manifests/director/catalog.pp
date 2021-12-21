# == Define: bareos::director::catalog
# To define in what database to keep the list of files and the Volume names where they are backed up.
# Most people only use a single catalog.
# It is possible, however not adviced and not supported to use multiple catalogs.
#
# == Parameters
# [*ensure*]
#   present or absent the config file.
#
# [*db_address*]
#   Db Address
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*db_driver*]
#   Db Driver
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: true
#
# [*db_name*]
#   Db Name
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: true
#
# [*db_password*]
#   Db Password
#
#   Bareos Datatype: autopassword
#   Bareos Default: Not set
#   Required: false
#
# [*db_port*]
#   Db Port
#
#   Bareos Datatype: pint32
#   Bareos Default: Not set
#   Required: false
#
# [*db_socket*]
#   Db Socket
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*db_user*]
#   Db User
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*description*]
#   Description
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*disable_batch_insert*]
#   Disable Batch Insert
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*exit_on_fatal*]
#   Exit On Fatal: Make any fatal error in the connection to the database exit the program
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*idle_timeout*]
#   Idle Timeout
#
#   Bareos Datatype: pint32
#   Bareos Default: 30
#   Required: false
#
# [*inc_connections*]
#   Inc Connections
#
#   Bareos Datatype: pint32
#   Bareos Default: 1
#   Required: false
#
# [*max_connections*]
#   Max Connections
#
#   Bareos Datatype: pint32
#   Bareos Default: 5
#   Required: false
#
# [*min_connections*]
#   Min Connections
#
#   Bareos Datatype: pint32
#   Bareos Default: 1
#   Required: false
#
# [*multiple_connections*]
#   Multiple Connections
#
#   Bareos Datatype: bit
#   Bareos Default: Not set
#   Required: false
#
# [*reconnect*]
#   Reconnect: Try to reconnect a database connection when its dropped
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false

# [*validate_timeout*]
#   Validate Timeout
#
#   Bareos Datatype: pint32
#   Bareos Default: 120
#   Required: false
#
define bareos::director::catalog (
  Bareos::Module::Ensure $ensure = present,
  Optional[String] $db_address = undef,
  Optional[String] $db_driver = undef,
  Optional[String] $db_name = undef,
  Optional[String] $db_password = undef,
  Optional[Stdlib::Port] $db_port = undef,
  Optional[String] $db_socket = undef,
  Optional[String] $db_user = undef,
  Optional[String] $description = undef,
  Optional[Bareos::Boolean] $disable_batch_insert = undef,
  Optional[Bareos::Boolean] $exit_on_fatal = undef,
  Optional[Integer[0]] $idle_timeout = undef,
  Optional[Integer[0]] $inc_connections = undef,
  Optional[Integer[0]] $max_connections = undef,
  Optional[Integer[0]] $min_connections = undef,
  Optional[Bareos::Boolean] $multiple_connections = undef,
  Optional[Bareos::Boolean] $reconnect = undef,
  Optional[Integer[0]] $validate_timeout = undef,
) {
  include bareos::director

  $_resource = 'Catalog'
  $_resource_dir = 'catalog'

  if $ensure == 'present' {
    $_settings = bareos_settings( [$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$db_address, 'Db Address', 'string', false],
      [$db_driver, 'Db Driver', 'string', true],
      [$db_name, 'Db Name', 'string', true],
      [$db_password, 'Db Password', 'autopassword', false],
      [$db_port, 'Db Port', 'pint32', false],
      [$db_socket, 'Db Socket', 'string', false],
      [$db_user, 'Db User', 'string', false],
      [$disable_batch_insert, 'Disable Batch Insert', 'boolean', false],
      [$exit_on_fatal, 'Exit On Fatal', 'boolean', false],
      [$idle_timeout, 'Idle Timeout', 'pint32', false],
      [$inc_connections, 'Inc Connections', 'pint32', false],
      [$max_connections, 'Max Connections', 'pint32', false],
      [$min_connections, 'Min Connections', 'pint32', false],
      [$multiple_connections, 'Multiple Connections', 'bit', false],
      [$reconnect, 'Reconnect', 'boolean', false],
      [$validate_timeout, 'Validate Timeout', 'pint32', false]
    )
  }

  file { "${bareos::director::config_dir}/${_resource_dir}/${name}.conf":
    ensure  => $ensure,
    mode    => $bareos::file_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    content => template('bareos/resource.erb'),
    notify  => [
      Service[$bareos::director::service_name],
    ],
    tag     => ['bareos', 'bareos_director'],
  }
  if $bareos::manage_database {
    File["${bareos::director::config_dir}/${_resource_dir}/${name}.conf"] ~> Exec['bareos director init catalog']
  }
}
