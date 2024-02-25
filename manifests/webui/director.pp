# @summary 
#   Configures an director to use with the webui.
#
# @param ensure
#   present or absent the config file.
#
# @param catalog
#   Catalog
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# @param dir_address
#   Dir Address
#
#   Bareos Datatype: address
#   Bareos Default: 9101
#   Required: false
#
# @param dir_port
#   Dir Port
#
#   Bareos Datatype: port
#   Bareos Default: 9101
#   Required: false
#
# @param enabled
#   Enable or disable section. Possible values are "yes" or "no", the default is "yes".
#
# @param pam_console_name
#   Pam Console Name
#
#   Bareos datatype: res
#   Bareos default: not set
#   Required: false
#
# @param pam_console_password
#   Pam Console Password
#
#   Bareos datatype: res
#   Bareos default: not set
#   Required: false
define bareos::webui::director (
  Enum['present', 'absent'] $ensure = present,
  Optional[Bareos::Resource] $catalog = undef,
  Stdlib::Host $dir_address = 'localhost',
  Stdlib::Port $dir_port = 9101,
  Enum['yes', 'no'] $enabled = 'yes',
  Optional[Bareos::Resource] $pam_console_name = undef,
  Optional[String] $pam_console_password = undef,
) {
  include bareos::webui

  if $ensure == 'present' {
    # just for validation
    $_validate = bareos_settings([$catalog, 'Catalog', 'res', false],
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
