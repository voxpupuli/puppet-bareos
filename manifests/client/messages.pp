# == Define: bareos::client::messages
# The Messages resource defines how messages are to be handled and destinations to which they should be sent.
#
# == Parameters
# [*ensure*]
#   present or absent the config file.
#
# [*append*]
#   Append
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# [*catalog*]
#   Catalog
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# [*console*]
#   Console
#
#   May be specified as Array.
#   Bareos Datatype: messages
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
# [*director*]
#   Director
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# [*file*]
#   File
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# [*mail*]
#   Mail
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# [*mail_command*]
#   Mail Command
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*mail_on_error*]
#   Mail On Error
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# [*mail_on_success*]
#   Mail On Success
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# [*operator*]
#   Operator
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# [*operator_command*]
#   Operator Command
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*stderr*]
#   Stderr
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# [*stdout*]
#   Stdout
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# [*syslog*]
#   Syslog
#
#   May be specified as Array.
#   Bareos Datatype: messages
#   Bareos Default: Not set
#   Required: false
#
# [*timestamp_format*]
#   Timestamp Format
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
define bareos::client::messages (
  $ensure = present,
  $append = undef,
  $catalog = undef,
  $console = undef,
  $description = undef,
  $director = undef,
  $file = undef,
  $mail = undef,
  $mail_command = undef,
  $mail_on_error = undef,
  $mail_on_success = undef,
  $operator = undef,
  $operator_command = undef,
  $stderr = undef,
  $stdout = undef,
  $syslog = undef,
  $timestamp_format = undef,
) {
  include ::bareos::client

  $_resource = 'Messages'
  $_resource_dir = 'messages'

  unless $ensure in [ 'present', 'absent' ] {
    fail('Invalid value for ensure')
  }

  if $ensure == 'present' {
    $_settings = bareos_settings(
      [$name, 'Name', 'name', true],
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

  file { "${::bareos::client::config_dir}/${_resource_dir}/${name}.conf":
    ensure  => $ensure,
    mode    => $bareos::file_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    content => template('bareos/resource.erb'),
    notify  => Service[$bareos::client::service_name],
    tag     => ['bareos', 'bareos_client'],
  }
}
