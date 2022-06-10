# @summary
#   This class manages the bareos (tray-) monitor package and configuration directory.
#   Parameters should be configured in the upper class `::bareos`.
#
# @api private
#
class bareos::monitor (
) {
  assert_private()

  if $bareos::manage_monitor_package {
    $bareos::monitor_packages.each |$monitor_package| {
      package { $monitor_package:
        ensure => $bareos::monitor_package_ensure,
        tag    => [ 'bareos', 'bareos_monitor', ],
      }
    }
  }

  $config_monitor_directories = [
    "${bareos::config_directory}/tray-monitor.d",
    "${bareos::config_directory}/tray-monitor.d/client",
    "${bareos::config_directory}/tray-monitor.d/director",
    "${bareos::config_directory}/tray-monitor.d/monitor",
    "${bareos::config_directory}/tray-monitor.d/storage",
  ]

  $config_monitor_directories.each |$config_monitor_directory| {
    file { $config_monitor_directory:
      ensure  => directory,
      purge   => true,
      recurse => true,
      force   => true,
      mode    => $bareos::config_directory_mode,
      owner   => $bareos::config_owner,
      group   => $bareos::config_group,
      tag     => [ 'bareos', 'bareos_monitor', ],
    }
  }
}
