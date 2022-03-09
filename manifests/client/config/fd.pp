# @summary
#   manage client configs for bareos
#
# @api private
#
class bareos::client::config::fd (
) {
  assert_private()

  $config = $bareos::client_config.has_key('fd') ? {
    true    => $bareos::client_config['fd'],
    default => {},
  }

  $client_config_directory = "${bareos::config_directory}/${bareos::client_config_directory}"

  file { "${client_config_directory}/client/bareos-fd.conf":
    ensure  => file,
    content => epp('bareos/client/fd.conf.epp', $config),
    group   => $bareos::config_group,
    mode    => $bareos::config_file_mode,
    owner   => $bareos::config_owner,
  }
}
