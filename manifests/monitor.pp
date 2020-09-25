# == Class: bareos::monitor
# This class manages the bareos (tray-) monitor package and configuration directory.
# Parameters should be configured in the upper class `::bareos`.
#
# This class will be automatically included when a resource is defined.
# It is not intended to be used directly by external resources like node definitions or other modules.
class bareos::monitor (
  $manage_package = $bareos::manage_package,
  $package_name   = $bareos::monitor_package_name,
  $package_ensure = $bareos::package_ensure,
  $config_dir     = "${bareos::config_dir}/tray-monitor.d"
) inherits ::bareos {
  if $manage_package {
    package { $package_name:
      ensure => $package_ensure,
      tag    => ['bareos', 'bareos_monitor'],
    }
  }

  # directories
  $config_monitor_dirs = [
    $config_dir,
    "${config_dir}/client",
    "${config_dir}/director",
    "${config_dir}/monitor",
    "${config_dir}/storage",
  ]

  file { $config_monitor_dirs:
    ensure  => directory,
    purge   => true,
    recurse => true,
    force   => true,
    mode    => $bareos::file_dir_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    require => Package[$package_name],
    tag     => ['bareos', 'bareos_monitor'],
  }
}
