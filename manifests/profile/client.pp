# == Class: bareos::profile::client
# setup an simple bareos filedaemon/client
class bareos::profile::client (
  Bareos::Resource $name_client = $facts['networking']['fqdn'],
  Bareos::Resource $name_dir = 'bareos-dir',
  String $password = 'MyClientPasswordPleaseChange',
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
