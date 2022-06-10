# @summary bareos::console
#
# @api private
#
class bareos::console (
) {
  assert_private()

  if $bareos::manage_console_package {
    $bareos::console_packages.each |$console_package| {
      package { $console_package:
        ensure => $bareos::console_package_ensure,
        tag    => [ 'bareos', 'bareos_console', ],
      }
    }
  }

  $config_console_directories = [
    "${bareos::config_directory}/bconsole.d",
    "${bareos::config_directory}/bconsole.d/console",
    "${bareos::config_directory}/bconsole.d/director",
  ]

  $config_console_directories.each | $config_console_directory | {
    file { $config_console_directory:
      ensure  => directory,
      purge   => true,
      recurse => true,
      force   => true,
      mode    => $bareos::config_directory_mode,
      owner   => $bareos::config_owner,
      group   => $bareos::config_group,
      tag     => [ 'bareos', 'bareos_console', ],
    }
  }

  Package<| tag == 'bareos_console' |> -> File<| tag == 'bareos_console' |>
}
