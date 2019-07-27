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
define bareos::webui::director (
  $ensure = present,
  $catalog = undef,
  $dir_address = 'localhost',
  $dir_port = 9101,
  $enabled = 'yes',
) {
  include bareos::webui

  unless $ensure in [ 'present', 'absent' ] {
    fail('Invalid value for ensure')
  }

  if $ensure == 'present' {
    # just for validation
    $_validate = bareos_settings(
      [$catalog, 'Catalog', 'res', false],
      [$dir_address, 'Dir Address', 'address', true],
      [$dir_port, 'Dir Port', 'port', true],
      [$enabled, 'Enabled', 'bit', true],
      [$name, 'Dir Name', 'res', true]
    )
    concat::fragment{ "bareos webui director ${title}":
      target  => "${bareos::webui::config_dir}/directors.ini",
      content =>  template('bareos/webui_directors.erb'),
      notify  => Service[$bareos::webui::service_name],
      tag     => ['bareos', 'bareos_webui'],
    }
  }
}
