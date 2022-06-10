# @summary
#   manage client configs for bareos
#
# @api private
#
class bareos::client::config (
) {
  assert_private()

  $client_config_directory = "${bareos::config_directory}/${bareos::client_config_directory}"

  if $bareos::enable_client {
    file { $client_config_directory:
      ensure  => directory,
      force   => true,
      group   => $bareos::config_group,
      mode    => $bareos::config_directory_mode,
      owner   => $bareos::config_owner,
      purge   => true,
      recurse => true,
    }

    [
      "${client_config_directory}/client",
      "${client_config_directory}/director",
      "${client_config_directory}/messages",
    ].each |$config_directory| {
      file { $config_directory:
        ensure => directory,
        group  => $bareos::config_group,
        mode   => $bareos::config_directory_mode,
        owner  => $bareos::config_owner,
      }
    }

    if $bareos::client_config.has_key('director') {
      $bareos::client_config['director'].each |$director, $settings| {
        bareos::client::config::director { $director:
          * => $settings,
        }
      }
    }

    # if $bareos::client_config.has_key('messages') {
    #   $bareos::client_config['messages'].each |$messages, $settings| {
    #     bareos::client::config::messages { $messages:
    #       * => $settings,
    #     }
    #   }
    # }

    # bareos::client::config::messages { 'Standard':
    #   description => 'Send relevant messages to the Director.',
    #   director    => 'bareos-dir = all, !skipped, !restored',
    # }
  } else {
    file { $client_config_directory:
      ensure  => absent,
      force   => true,
      purge   => true,
      recurse => true,
    }
  }
}
