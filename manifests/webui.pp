# == Class: bareos::webui
# This class manages the bareos webui service, package and configuration.
#
# This class will be automatically included when a resource is defined.
class bareos::webui (
  String $config_dir = $bareos::config_dir_webui,
  Hash $directors = {},
  Optional[String] $label_pooltype = undef,
  Boolean $manage_local_dir = true, # setup local bareos director
  Boolean $manage_package = $bareos::manage_package,
  Boolean $manage_service = $bareos::manage_service,
  String $package_ensure = $bareos::package_ensure,
  Variant[String, Array[String]] $package_name = $bareos::webui_package_name,
  Integer $pagination_default_value = 25,
  String $pagination_values = '10,25,50,100',
  Boolean $save_previous_state = false,
  Boolean $service_enable = $bareos::service_enable,
  String $service_ensure = $bareos::service_ensure,
  String $service_name = $bareos::webui_service_name,
  Integer $session_timeout = 3600,
) inherits bareos {
  if $manage_package {
    package { $package_name:
      ensure => $package_ensure,
      tag    => ['bareos', 'bareos_webui'],
    }
  }

  if $manage_service {
    service { $service_name:
      ensure => $service_ensure,
      enable => $service_enable,
      tag    => ['bareos', 'bareos_webui'],
    }
  }

  # directories
  file { $config_dir:
    ensure  => directory,
    purge   => true,
    recurse => true,
    force   => true,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Package[$package_name],
    tag     => ['bareos', 'bareos_webui'],
  }

  file { "${bareos::webui::config_dir}/configuration.ini":
    ensure  => file,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('bareos/webui_configuration.erb'),
    notify  => Service[$bareos::webui::service_name],
    tag     => ['bareos', 'bareos_webui'],
  }

  concat { "${bareos::webui::config_dir}/directors.ini":
    ensure => present,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    tag    => ['bareos', 'bareos_webui'],
  }

  if $manage_local_dir {
    bareos::webui::director { 'localhost':
      dir_address => 'localhost',
    }
  }

  create_resources(bareos::webui::director, $directors)
}
