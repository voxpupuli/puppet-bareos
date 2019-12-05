# == Class: bareos::profile::client
# setup an simple bareos filedaemon/client
class bareos::profile::client(
  $name_client = $::fqdn,
  $name_dir = 'bareos-dir',
  $password = 'MyClientPasswordPleaseChange',
) {

  # default client
  class { 'bareos::client::client':
    name_client => $name_client,
  }

  # allow bareos server to connect
  ::bareos::client::director { $name_dir:
    password => $password,
  }

  ::bareos::client::messages { 'Standard':
    description => 'Send relevant messages to the Director.',
    director    => 'bareos-dir = all, !skipped, !restored',
  }
}
