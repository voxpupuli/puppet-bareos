# @summary 
#   To define in what database to keep the list of files and the Volume names where they are backed up. Most people only use a single catalog. It is possible, however not adviced and not supported to use multiple catalogs.
#
# @param ensure
#   present or absent the config file.
#
# @param db_address
#   Db Address
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# @param db_driver
#   Db Driver
#
#   Bareos Datatype: string
#   Bareos Default: postgresql
#   Required: false
#
#   This parameter is deprecated. The only valid value under bareos >= 21 is
#   `postgresql`.
#
#   See https://docs.bareos.org/Configuration/Director.html#config-Dir_Catalog_DbDriver
#
# @param db_name
#   Db Name
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: true
#
# @param db_password
#   Db Password
#
#   Bareos Datatype: autopassword
#   Bareos Default: Not set
#   Required: false
#
# @param db_port
#   Db Port
#
#   Bareos Datatype: pint32
#   Bareos Default: Not set
#   Required: false
#
# @param db_socket
#   Db Socket
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# @param db_user
#   Db User
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# @param description
#   Description
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# @param disable_batch_insert
#   Disable Batch Insert
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# @param exit_on_fatal
#   Exit On Fatal: Make any fatal error in the connection to the database exit the program
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# @param idle_timeout
#   Idle Timeout
#
#   Bareos Datatype: pint32
#   Bareos Default: 30
#   Required: false
#
# @param inc_connections
#   Inc Connections
#
#   Bareos Datatype: pint32
#   Bareos Default: 1
#   Required: false
#
# @param max_connections
#   Max Connections
#
#   Bareos Datatype: pint32
#   Bareos Default: 5
#   Required: false
#
# @param min_connections
#   Min Connections
#
#   Bareos Datatype: pint32
#   Bareos Default: 1
#   Required: false
#
# @param multiple_connections
#   Multiple Connections
#
#   Bareos Datatype: bit
#   Bareos Default: Not set
#   Required: false
#
# @param reconnect
#   Reconnect: Try to reconnect a database connection when its dropped
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# @param validate_timeout
#   Validate Timeout
#
#   Bareos Datatype: pint32
#   Bareos Default: 120
#   Required: false
#
define bareos::director::catalog (
  Enum['present','absent'] $ensure = present,
  $db_address = undef,
  $db_driver = undef,
  $db_name = undef,
  $db_password = undef,
  $db_port = undef,
  $db_socket = undef,
  $db_user = undef,
  $description = undef,
  $disable_batch_insert = undef,
  $exit_on_fatal = undef,
  $idle_timeout = undef,
  $inc_connections = undef,
  $max_connections = undef,
  $min_connections = undef,
  $multiple_connections = undef,
  $reconnect = undef,
  $validate_timeout = undef,
) {
  include bareos::director

  $_resource = 'Catalog'
  $_resource_dir = 'catalog'

  if $ensure == 'present' {
    $_settings = bareos_settings([$name, 'Name', 'name', true],
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
