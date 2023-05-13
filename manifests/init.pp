# @summary This puppet module configures and manage all aspects of an complex bareos installation
#
# @author Richard Hillmann <richie@project0.de>
#
# @param repo_release
#   The major bareos release version which should be used
# @param repo_subscription
#   Activate the (paid) subscription repo. Otherwise the opensource repos will be selected
# @param repo_username
#   The major bareos release version which should be used
# @param repo_password
#   The major bareos release version which should be used
# @param manage_package
#   Whether puppet should handle the installation ob bareos packages
# @param manage_service
#   Whether puppet should activate the bareos system services
# @param manage_database
#   Whether puppet should call the bareos DB creation and configuration scripts
# @param package_ensure
#   Package version to be installed
# @param service_ensure
#   Service state which should be ensured
# @param service_enable
#   Whether puppet should enable the bareos services
# @param manage_repo
#   Whether puppet should manage the bareos package repository
# @param manage_user
#   Whether puppet should manage the bareos user
# @param package_name
#   Name of the package which should be installed
# @param director_service_allow_restart
#   Whether puppet is allowed to restart the director service. If not it will reload
#
class bareos (
  $config_dir                         = $bareos::params::config_dir,
  $config_dir_webui                   = $bareos::params::config_dir_webui,
  $file_owner                         = $bareos::params::file_owner,
  $file_group                         = $bareos::params::file_group,
  $file_mode                          = $bareos::params::file_mode,
  $file_dir_mode                      = $bareos::params::file_dir_mode,
  String  $repo_release               = '21',
  Boolean $repo_subscription          = false,
  Optional[String[1]]  $repo_username = undef,
  Optional[String[1]]  $repo_password = undef,
  Boolean $manage_package             = true,
  Boolean $manage_service             = true,
  Boolean $manage_database            = true,
  String  $package_ensure             = present,
  String  $service_ensure             = running,
  Boolean $service_enable             = true,
  Boolean $manage_repo                = true,
  Boolean $manage_user                = true,
  String  $package_name               = 'bareos-common',

  $console_package_name           = $bareos::params::console_package_name,
  $monitor_package_name           = $bareos::params::monitor_package_name,
  $director_package_name          = $bareos::params::director_package_name,
  $director_service_name          = $bareos::params::director_service_name,
  $director_service_allow_restart = false,
  $director_managed_dirs          = $bareos::params::director_managed_dirs,
  $client_package_name            = $bareos::params::client_package_name,
  $client_service_name            = $bareos::params::client_service_name,
  $storage_package_name           = $bareos::params::storage_package_name,
  $storage_service_name           = $bareos::params::storage_service_name,
) inherits bareos::params {
  if $manage_repo {
    class { 'bareos::repository':
      release      => $repo_release,
      subscription => $repo_subscription,
      username     => $repo_username,
      password     => $repo_password,
    }
  }

  if $manage_package {
    package { $package_name:
      ensure => $package_ensure,
      tag    => ['bareos', 'bareos_core'],
    }
  }

  if $manage_user {
    group { $file_group:
      ensure     => present,
      forcelocal => true,
      system     => true,
      tag        => ['bareos', 'bareos_core'],
    }
    -> user { $file_owner:
      ensure     => present,
      forcelocal => true,
      comment    => 'Bareos system user',
      home       => '/var/lib/bareos',
      shell      => '/bin/false',
      groups     => ['disk', 'tape', $file_group],
      system     => true,
      tag        => ['bareos', 'bareos_core'],
    }
  }

  file { $config_dir:
    ensure       => directory,
    purge        => true,
    recurse      => true,
    force        => true,
    recurselimit => 1,
    mode         => $bareos::file_dir_mode,
    owner        => $bareos::file_owner,
    group        => $bareos::file_group,
    require      => Package[$package_name],
    tag          => ['bareos', 'bareos_core'],
  }
}
