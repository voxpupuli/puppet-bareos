# == Class: bareos::webui::director
# Configures an director to use with the webui.
#
# == Parameters
# [*ensure*]
#   present or absent the config file.
#
# [*catalog*]
#   Catalog
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*dir_address*]
#   Dir Address
#
#   Bareos Datatype: address
#   Bareos Default: 9101
#   Required: false
#
# [*dir_port*]
#   Dir Port
#
#   Bareos Datatype: port
#   Bareos Default: 9101
#   Required: false
#
# [*enabled*]
#   Enable or disable section. Possible values are "yes" or "no", the default is "yes".
#
# [*pam_console_name*]
#   Pam Console Name
#
#   Bareos datatype: res
#   Bareos default: not set
#   Required: false
#
# [*pam_console_password*]
#   Pam Console Password
#
#   Bareos datatype: res
#   Bareos default: not set
#   Required: false
define bareos::webui::director (
  Enum['present', 'absent'] $ensure = present,
  Bareos::Resource $catalog = undef,
  Stdlib::Host $dir_address = 'localhost',
  Stdlib::Port $dir_port = 9101,
  Enum['yes', 'no'] $enabled = 'yes',
  Bareos::Resource $pam_console_name = undef,
  String $pam_console_password = undef,
) {
  include bareos::webui

  unless $ensure in ['present', 'absent'] {
    fail('Invalid value for ensure')
  }

  if $ensure == 'present' {
    # just for validation
    $_validate = bareos_settings( [$catalog, 'Catalog', 'res', false],
      [$dir_address, 'Dir Address', 'address', true],
      [$dir_port, 'Dir Port', 'port', true],
      [$enabled, 'Enabled', 'bit', true],
      [$name, 'Dir Name', 'res', true],
      [$pam_console_name, 'Pam Console Name', 'res', false],
      [$pam_console_password, 'Pam Console Password', 'autopassword', false]
    )
    concat::fragment { "bareos webui director ${title}":
      target  => "${bareos::webui::config_dir}/directors.ini",
      content => template('bareos/webui_directors.erb'),
      notify  => Service[$bareos::webui::service_name],
      tag     => ['bareos', 'bareos_webui'],
    }
  }
}
