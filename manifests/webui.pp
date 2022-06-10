# @summary
#   This class manages the bareos webui service, package and configuration.
#
# @api private
#
class bareos::webui (
) {
  assert_private()

  if $bareos::manage_webui_package {
    $bareos::webui_packages.each |$webui_package| {
      package { $webui_package:
        ensure => $webui_package_ensure,
        tag    => [ 'bareos', 'bareos_webui', ],
      }

      Package[$webui_package] -> File[$webui_config_directory]
    }
  }

  if $bareos::manage_webui_service {
    service { $bareos::webui_service:
      ensure    => $bareos::webui_service_ensure,
      enable    => $bareos::webui_service_enable,
      tag       => [ 'bareos', 'bareos_webui', ],
      subscribe => File["${bareos::webui_config_directory}/configuration.ini"],
    }
  }

  file { $bareos::webui_config_directory:
    ensure  => directory,
    purge   => true,
    recurse => true,
    force   => true,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    tag     => [ 'bareos', 'bareos_webui', ],
  }

  $configuration = {
    'session_timeout'          => $bareos::webui_session_timeout,
    'pagination_values'        => $bareos::webui_pagination_values,
    'pagination_default_value' => $bareos::webui_pagination_default_value,
    'save_previous_state'      => $bareos::webui_save_previous_state,
    'label_pooltype'           => $bareos::webui_label_pooltype,
  }

  file { "${bareos::webui_config_directory}/configuration.ini":
    ensure  => file,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => epp('bareos/webui/webui_configuration.erb', $configuration),
    tag     => [ 'bareos', 'bareos_webui', ],
  }

  if $bareos::webui_manage_local_director {
    bareos::webui::director { 'localhost':
      director_address => 'localhost',
    }
  }

  $bareso::webui_directors.each |$key, $values| {
    bareos::webui::director { $key:
      * => $values,
    }
  }
}
