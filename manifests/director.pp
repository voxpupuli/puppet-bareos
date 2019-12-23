# == Class: bareos::director
# This class manages the bareos director service, packages and configuration directory.
# Parameters should be configured in the upper class `::bareos`.
#
# This class will be automatically included when a resource is defined.
# It is not intended to be used directly by external resources like node definitions or other modules.
class bareos::director(
<<<<<<< HEAD
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
  Optional[Hash] $catalogs    = {},
  Optional[Hash] $clients     = {},
  Optional[Hash] $consoles    = {},
  Optional[Hash] $counters    = {},
  Optional[Hash] $directors   = {},
  Optional[Hash] $filesets    = {},
  Optional[Hash] $jobs        = {},
  Optional[Hash] $jobdefs     = {},
  Optional[Hash] $messages    = {},
  Optional[Hash] $pools       = {},
  Optional[Hash] $profiles    = {},
  Optional[Hash] $schedules   = {},
  Optional[Hash] $storages    = {},
=======
  $manage_service           = $::bareos::manage_service,
  $manage_package           = $::bareos::manage_package,
  $manage_database          = $::bareos::manage_database,
  $package_name             = $::bareos::director_package_name,
  $package_ensure           = $::bareos::package_ensure,
  $service_name             = $::bareos::director_service_name,
  $service_ensure           = $::bareos::service_ensure,
  $service_enable           = $::bareos::service_enable,
  $config_dir               = "${::bareos::config_dir}/bareos-dir.d",
  Optional[Hash] $catalogs  = {},
  Optional[Hash] $clients   = {},
  Optional[Hash] $consoles  = {},
  Optional[Hash] $counters  = {},
  Optional[Hash] $directors = {},
  Optional[Hash] $filesets  = {},
  Optional[Hash] $jobs      = {},
  Optional[Hash] $jobdefs   = {},
  Optional[Hash] $messages  = {},
  Optional[Hash] $pools     = {},
  Optional[Hash] $profiles  = {},
  Optional[Hash] $schedules = {},
  Optional[Hash] $storages  = {},
>>>>>>> fixup typo
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

  create_resources(::bareos::director::catalog, $catalogs)
  create_resources(::bareos::director::client, $clients)
  create_resources(::bareos::director::consoles, $consoles)
  create_resources(::bareos::director::counters, $counters)
  create_resources(::bareos::director::directors, $directors)
  create_resources(::bareos::director::filesets, $filesets)
  create_resources(::bareos::director::jobs, $jobs)
  create_resources(::bareos::director::jobdefs, $jobdefs)
  create_resources(::bareos::director::messages, $messages)
  create_resources(::bareos::director::pools, $pools)
  create_resources(::bareos::director::profiles, $profiles)
  create_resources(::bareos::director::schedules, $schedules)
  create_resources(::bareos::director::storages, $storages)
}
