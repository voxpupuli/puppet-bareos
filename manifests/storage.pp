# == Class: bareos::storage
# This class manages the bareos storage service, packages and configuration directory.
# Parameters should be configured in the upper class `::bareos`.

# This class will be automatically included when a resource is defined.
# It is not intended to be used directly by external resources like node definitions or other modules.
class bareos::storage (
  Boolean $manage_service = $bareos::manage_service,
  Boolean $manage_package = $bareos::manage_package,
  Variant[String, Array[String]] $package_name = $bareos::storage_package_name,
  String $package_ensure = $bareos::package_ensure,
  String $service_name = $bareos::storage_service_name,
  String $service_ensure = $bareos::service_ensure,
  Boolean $service_enable = $bareos::service_enable,
  String $config_dir = "${bareos::config_dir}/bareos-sd.d",
  Hash $autochangers = {},
  Hash $devices = {},
  Hash $directors = {},
  Hash $messages = {},
  Hash $ndmps = {},
) inherits bareos {
  include bareos::storage::storage

  if $manage_package {
    package { $package_name:
      ensure => $package_ensure,
      tag    => ['bareos', 'bareos_storage'],
    }
  }

  if $manage_service {
    service { $service_name:
      ensure => $service_ensure,
      enable => $service_enable,
      tag    => ['bareos', 'bareos_storage'],
    }
  }

  # directories
  $config_storage_dirs = [
    $config_dir,
    "${config_dir}/autochanger",
    "${config_dir}/device",
    "${config_dir}/director",
    "${config_dir}/messages",
    "${config_dir}/ndmp",
    "${config_dir}/storage",
  ]

  file { $config_storage_dirs:
    ensure  => directory,
    purge   => true,
    recurse => true,
    force   => true,
    mode    => $bareos::file_dir_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    require => Package[$package_name],
    notify  => Service[$service_name],
    tag     => ['bareos', 'bareos_storage'],
  }

  $autochangers.each |String $resource, Hash $attributes| {
    bareos::storage::autochanger { $resource:
      * => $attributes;
    }
  }
  $devices.each |String $resource, Hash $attributes| {
    bareos::storage::device { $resource:
      * => $attributes;
    }
  }
  $directors.each |String $resource, Hash $attributes| {
    bareos::storage::director { $resource:
      * => $attributes;
    }
  }
  $messages.each |String $resource, Hash $attributes| {
    bareos::storage::messages { $resource:
      * => $attributes;
    }
  }
  $ndmps.each |String $resource, Hash $attributes| {
    bareos::storage::ndmp { $resource:
      * => $attributes;
    }
  }
}
