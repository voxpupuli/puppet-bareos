# @summary
#   The Messages resource defines how messages are to be handled and destinations to which they should be sent.
#
# @param ensure
#   present or absent the config file.
#
# @param append
#   Append
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# @param catalog
#   Catalog
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# @param console
#   Console
#
#   May be specified as Array.
#   Bareos Datatype: messages
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
# @param director
#   Director
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# @param file
#   File
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# @param mail
#   Mail
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# @param mail_command
#   Mail Command
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# @param mail_on_error
#   Mail On Error
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# @param mail_on_success
#   Mail On Success
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# @param operator
#   Operator
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# @param operator_command
#   Operator Command
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# @param stderr
#   Stderr
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# @param stdout
#   Stdout
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# @param syslog
#   Syslog
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# @param timestamp_format
#   Timestamp Format
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
define bareos::client::messages (
  Enum['present','absent'] $ensure = present,
  Optional[Variant[Array[String[1]],String[1]]] $append = undef,
  Optional[Variant[Array[String[1]],String[1]]] $catalog = undef,
  Optional[Variant[Array[String[1]],String[1]]] $console = undef,
  Optional[String[1]] $description = undef,
  Optional[Variant[Array[String[1]],String[1]]] $director = undef,
  Optional[Variant[Array[String[1]],String[1]]] $file = undef,
  Optional[Variant[Array[String[1]],String[1]]] $mail = undef,
  Optional[String[1]] $mail_command = undef,
  Optional[Variant[Array[String[1]],String[1]]] $mail_on_error = undef,
  Optional[Variant[Array[String[1]],String[1]]] $mail_on_success = undef,
  Optional[Variant[Array[String[1]],String[1]]] $operator = undef,
  Optional[String[1]] $operator_command = undef,
  Optional[Variant[Array[String[1]],String[1]]] $stderr = undef,
  Optional[Variant[Array[String[1]],String[1]]] $stdout = undef,
  Optional[Variant[Array[String[1]],String[1]]] $syslog = undef,
  Optional[String[1]] $timestamp_format = undef,
) {
  include bareos::client

  $_resource = 'Messages'
  $_resource_dir = 'messages'

  if $ensure == 'present' {
    $_settings = bareos_settings([$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$append, 'Append', 'messages_list', false],
      [$catalog, 'Catalog', 'messages_list', false],
      [$console, 'Console', 'messages_list', false],
      [$director, 'Director', 'messages_list', false],
      [$file, 'File', 'messages_list', false],
      [$mail_command, 'Mail Command', 'string', false],
      [$mail, 'Mail', 'messages_list', false],
      [$mail_on_error, 'Mail On Error', 'messages_list', false],
      [$mail_on_success, 'Mail On Success', 'messages_list', false],
      [$operator_command, 'Operator Command', 'string', false],
      [$operator, 'Operator', 'messages_list', false],
      [$stderr, 'Stderr', 'messages_list', false],
      [$stdout, 'Stdout', 'messages_list', false],
      [$syslog, 'Syslog', 'messages_list', false],
      [$timestamp_format, 'Timestamp Format', 'string', false]
    )
  }

  file { "${bareos::client::config_dir}/${_resource_dir}/${name}.conf":
    ensure  => $ensure,
    mode    => $bareos::file_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    content => template('bareos/resource.erb'),
    notify  => Service[$bareos::client::service_name],
    tag     => ['bareos', 'bareos_client'],
  }
}
