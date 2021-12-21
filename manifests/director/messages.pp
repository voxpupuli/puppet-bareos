# == Define: bareos::director::messages
# To define where error and information messages are to be sent or logged.
# You may define multiple different message resources and hence direct particular classes of messages to different users or locations (files, ...).
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
define bareos::director::messages (
  Bareos::Module::Ensure $ensure = present,
  Optional[Bareos::List::String] $append = undef,
  Optional[Bareos::List::String] $catalog = undef,
  Optional[Bareos::List::String] $console = undef,
  Optional[String] $description = undef,
  Optional[Bareos::List::String] $director = undef,
  Optional[Bareos::List::String] $file = undef,
  Optional[Bareos::List::String] $mail = undef,
  Optional[String] $mail_command = undef,
  Optional[Bareos::List::String] $mail_on_error = undef,
  Optional[Bareos::List::String] $mail_on_success = undef,
  Optional[Bareos::List::String] $operator = undef,
  Optional[String] $operator_command = undef,
  Optional[Bareos::List::String] $stderr = undef,
  Optional[Bareos::List::String] $stdout = undef,
  Optional[Bareos::List::String] $syslog = undef,
  Optional[String] $timestamp_format = undef,
) {
  include bareos::director

  $_resource = 'Messages'
  $_resource_dir = 'messages'

  if $ensure == 'present' {
    $_settings = bareos_settings( [$name, 'Name', 'name', true],
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

  file { "${bareos::director::config_dir}/${_resource_dir}/${name}.conf":
    ensure  => $ensure,
    mode    => $bareos::file_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    content => template('bareos/resource.erb'),
    notify  => Service[$bareos::director::service_name],
    tag     => ['bareos', 'bareos_director'],
  }
}
