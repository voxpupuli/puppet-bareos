# == Class: bareos::director
# This class manages the bareos director service, packages and configuration directory.
# Parameters should be configured in the upper class `::bareos`.
#
# This class will be automatically included when a resource is defined.
# It is not intended to be used directly by external resources like node definitions or other modules.
class bareos::director(
  $manage_service             = $::bareos::manage_service,
  $manage_package             = $::bareos::manage_package,
  $manage_database            = $::bareos::manage_database,
  $package_name               = $::bareos::director_package_name,
  $package_ensure             = $::bareos::package_ensure,
  $service_name               = $::bareos::director_service_name,
  $service_ensure             = $::bareos::service_ensure,
  $service_enable             = $::bareos::service_enable,
  $config_dir                 = "${::bareos::config_dir}/bareos-dir.d",
  Array[String] $managed_dirs = $::bareos::director_managed_dirs,
  Hash $catalogs              = {},
  Hash $clients               = {},
  Hash $consoles              = {},
  Hash $counters              = {},
  Hash $directors             = {},
  Hash $filesets              = {},
  Hash $jobs                  = {},
  Hash $jobdefs               = {},
  Hash $messages              = {},
  Hash $pools                 = {},
  Hash $profiles              = {},
  Hash $schedules             = {},
  Hash $storages              = {},
) inherits ::bareos {
  include ::bareos::director::director

  if $manage_package {
    package { $package_name:
      ensure => $package_ensure,
      tag    => ['bareos', 'bareos_director'],
    }
  }

  if $manage_service {
    service { $service_name:
      ensure => $service_ensure,
      enable => $service_enable,
      tag    => ['bareos', 'bareos_director'],
    }
  }

  file { $config_dir:
    ensure  => directory,
    force   => true,
    mode    => $::bareos::file_dir_mode,
    owner   => $::bareos::file_owner,
    group   => $::bareos::file_group,
    require => Package[$package_name],
    notify  => Service[$service_name],
    tag     => ['bareos', 'bareos_director'],
  }

  $managed_dirs.each |$managed_dir| {
    file { "${config_dir}/${managed_dir}":
      ensure  => directory,
      purge   => true,
      recurse => true,
      force   => true,
      require => Package[$package_name],
      mode    => $::bareos::file_dir_mode,
      owner   => $::bareos::file_owner,
      group   => $::bareos::file_group,
      notify  => Service[$service_name],
      tag     => ['bareos', 'bareos_director'],
    }
  }

  if $manage_database {
    File <| tag == 'bareos_director' |> -> exec { 'bareos director init catalog':
      command     => '/usr/lib/bareos/scripts/create_bareos_database && /usr/lib/bareos/scripts/make_bareos_tables && /usr/lib/bareos/scripts/grant_bareos_privileges',
      notify      => Service[$::bareos::director::service_name],
      refreshonly => true,
      tag         => ['bareos', 'bareos_director'],
    }
  }

  $catalogs.each |String $resource, Hash $attributes| {
    bareos::director::catalog { $resource:
      * => $attributes;
    }
  }
  $clients.each |String $resource, Hash $attributes| {
    bareos::director::client { $resource:
      * => $attributes;
    }
  }
  $consoles.each |String $resource, Hash $attributes| {
    bareos::director::console { $resource:
      * => $attributes;
    }
  }
  $filesets.each |String $resource, Hash $attributes| {
    bareos::director::fileset { $resource:
      * => $attributes;
    }
  }
  $jobs.each |String $resource, Hash $attributes| {
    bareos::director::job { $resource:
      * => $attributes;
    }
  }
  $jobdefs.each |String $resource, Hash $attributes| {
    bareos::director::jobdefs { $resource:
      * => $attributes;
    }
  }
  $messages.each |String $resource, Hash $attributes| {
    bareos::director::messages { $resource:
      * => $attributes;
    }
  }
  $pools.each |String $resource, Hash $attributes| {
    bareos::director::pool { $resource:
      * => $attributes;
    }
  }
  $profiles.each |String $resource, Hash $attributes| {
    bareos::director::profile { $resource:
      * => $attributes;
    }
  }
  $schedules.each |String $resource, Hash $attributes| {
    bareos::director::schedule { $resource:
      * => $attributes;
    }
  }
  $storages.each |String $resource, Hash $attributes| {
    bareos::director::storage { $resource:
      * => $attributes;
    }
  }
}
