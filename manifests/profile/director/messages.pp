# == Class: bareos::profile::director::messages
# Default messages
class bareos::profile::director::messages {
  ::bareos::director::messages {'Daemon':
    description  => 'Message delivery for daemon messages (no job).',
    mail_command => '/usr/bin/bsmtp -h localhost -f \"\(Bareos\) \<%r\>\" -s \"Bareos daemon message\" %r',
    mail         => 'root@localhost = all, !skipped, !audit',
    console      => 'all, !skipped, !saved, !audit',
    append       => [
      '"/var/log/bareos/bareos.log" = all, !skipped, !audit',
      '"/var/log/bareos/bareos-audit.log" = audit',
      ],
  }

  ::bareos::director::messages {'Standard':
    description      => 'Reasonable message delivery -- send most everything to email address and to the console.',
    operator_command => '/usr/bin/bsmtp -h localhost -f \"\(Bareos\) \<%r\>\" -s \"Bareos: Intervention needed for %j\" %r',
    mail_command     => '/usr/bin/bsmtp -h localhost -f \"\(Bareos\) \<%r\>\" -s \"Bareos: %t %e of %c %l\" %r',
    operator         => 'root@localhost = mount',
    mail             => 'root@localhost = all, !skipped, !saved, !audit',
    console          => 'all, !skipped, !saved, !audit',
    append           => '/var/log/bareos/bareos.log = all, !skipped, !saved, !audit',
    catalog          => 'all, !skipped, !saved, !audit',
  }
}
