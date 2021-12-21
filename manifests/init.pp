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
  String $config_dir = $bareos::params::config_dir,
  String $config_dir_webui = $bareos::params::config_dir_webui,
  String $file_owner = $bareos::params::file_owner,
  String $file_group = $bareos::params::file_group,
  String $file_mode = $bareos::params::file_mode,
  String $file_dir_mode = $bareos::params::file_dir_mode,
  String $repo_release = '20',
  Boolean $repo_subscription = false,
  Optional[String[1]]  $repo_username = undef,
  Optional[String[1]]  $repo_password = undef,
  Boolean $manage_package = true,
  Boolean $manage_service = true,
  Boolean $manage_database = true,
  String $package_ensure = present,
  String $service_ensure = running,
  Boolean $service_enable = true,
  Boolean $manage_repo = true,
  Boolean $manage_user = true,
  Variant[String, Array[String]] $package_name = 'bareos-common',
  Variant[String, Array[String]] $console_package_name = $bareos::params::console_package_name,
  Variant[String, Array[String]] $monitor_package_name = $bareos::params::monitor_package_name,
  Variant[String, Array[String]] $director_package_name = $bareos::params::director_package_name,
  String $director_service_name = $bareos::params::director_service_name,
  Boolean $director_service_allow_restart = false,
  Array[String] $director_managed_dirs = $bareos::params::director_managed_dirs,
  Variant[String, Array[String]] $client_package_name = $bareos::params::client_package_name,
  String $client_service_name = $bareos::params::client_service_name,
  Variant[String, Array[String]] $storage_package_name = $bareos::params::storage_package_name,
  String $storage_service_name = $bareos::params::storage_service_name,
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
    recurselimit => 1,
    mode         => $bareos::file_dir_mode,
    owner        => $bareos::file_owner,
    group        => $bareos::file_group,
    tag          => ['bareos', 'bareos_core'],
  }
}
