# @summary
#   The Director resource defines the name and password of the Directors that are permitted to contact this Client.
#
# @api private
#
define bareos::client::config::director (
  $config,
) {
  assert_private()

  $client_config_directory = "${bareos::config_directory}/${bareos::client_config_directory}"

  file { "${client_config_directory}/director/${title}.conf":
    ensure  => file,
    content => epp('bareos/client/director.conf.epp', $config),
    group   => $bareos::config_group,
    mode    => $bareos::config_file_mode,
    owner   => $bareos::config_owner,
  }
}
