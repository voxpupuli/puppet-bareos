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
  Enum['present', 'absent']  $ensure               = present,
  Optional[Bareos::Resource] $catalog              = undef,
  Stdlib::Host               $director_address     = 'localhost',
  Stdlib::Port               $director_port        = 9101,
  Enum['yes', 'no']          $enabled              = 'yes',
  Optional[Bareos::Resource] $pam_console_name     = undef,
  Optional[String]           $pam_console_password = undef,
) {
  assert_private()

  if ! defined("Concat[${bareos::webui_config_directory}/directors.ini]") {
    concat { "${bareos::webui_config_directory}/directors.ini":
      ensure => present,
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
      tag    => [ 'bareos', 'bareos_webui', ],
    }
  }

  concat::fragment { "bareos webui director ${title}":
    ensure  => $ensure,
    target  => "${bareos::webui_config_directory}/directors.ini",
    content => epp('bareos/webui/webui_directors.erb',
      {
        'catalog'              => $catalog,
        'director_address'     => $director_address,
        'director_port'        => $director_port,
        'enabled'              => $enabled,
        'pam_console_name'     => $pam_console_name,
        'pam_console_password' => $pam_console_password,
      }
    ),
    notify  => Service[$bareos::webui_service],
    tag     => [ 'bareos', 'bareos_webui', ],
  }
}
