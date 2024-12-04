# @summary
#   Manages the bareos console (bconsole cli tool) package and configuration directory. Parameters should be configured in the bareos class. This class will be automatically included when a resource is defined. It is not intended to be used directly by external resources like node definitions or other modules.
# @param manage_package
# @param package_name
# @param package_ensure
# @param config_dir
#
class bareos::console (
  Boolean $manage_package          = $bareos::manage_package,
  String[1] $package_name          = $bareos::console_package_name,
  String[1] $package_ensure        = $bareos::package_ensure,
  Stdlib::Absolutepath $config_dir = "${bareos::config_dir}/bconsole.d"
) inherits bareos {
  if $manage_package {
    package { $package_name:
      ensure => $package_ensure,
      tag    => ['bareos', 'bareos_console'],
    }
  }

  # directories
  $config_console_dirs = [
    $config_dir,
    "${config_dir}/console",
    "${config_dir}/director",
  ]

  file { $config_console_dirs:
    ensure  => directory,
    purge   => true,
    recurse => true,
    force   => true,
    mode    => $bareos::file_dir_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    require => Package[$package_name],
    tag     => ['bareos', 'bareos_console'],
  }
}
