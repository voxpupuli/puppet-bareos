# @summary
#   Manages the bareos client (file-daemon) service, packages and configuration directory. Parameters should be configured in the bareos class. This class will be automatically included when a resource is defined. It is not intended to be used directly by external resources like node definitions or other modules.
#
# @param manage_service
# @param manage_package
# @param package_name
# @param package_ensure
# @param service_name
# @param service_ensure
# @param service_enable
# @param config_dir
#
class bareos::client (
  $manage_service = $bareos::manage_service,
  $manage_package = $bareos::manage_package,
  $package_name   = $bareos::client_package_name,
  $package_ensure = $bareos::package_ensure,
  $service_name   = $bareos::client_service_name,
  $service_ensure = $bareos::service_ensure,
  $service_enable = $bareos::service_enable,
  $config_dir     = "${bareos::config_dir}/bareos-fd.d"
) inherits bareos {
  include bareos::client::client

  if $manage_package {
    package { $package_name:
      ensure => $package_ensure,
      tag    => ['bareos', 'bareos_client'],
    }
  }

  if $manage_service {
    service { $service_name:
      ensure => $service_ensure,
      enable => $service_enable,
      tag    => ['bareos', 'bareos_client'],
    }
  }

  # directories
  $config_client_dirs = [
    $config_dir,
    "${config_dir}/client",
    "${config_dir}/director",
    "${config_dir}/messages",
  ]

  file { $config_client_dirs:
    ensure  => directory,
    purge   => true,
    recurse => true,
    force   => true,
    mode    => $bareos::file_dir_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    require => Package[$package_name],
    notify  => Service[$service_name],
    tag     => ['bareos', 'bareos_client'],
  }
}
