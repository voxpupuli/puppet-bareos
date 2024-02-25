# @summary
#   setup an simple bareos filedaemon/client
# @param name_client
# @param name_dir
# @param password
class bareos::profile::client (
  String[1] $name_client = $facts['networking']['fqdn'],
  String[1] $name_dir    = 'bareos-dir',
  String[1] $password    = 'MyClientPasswordPleaseChange',
) {
  # default client
  class { 'bareos::client::client':
    name_client => $name_client,
  }

  # allow bareos server to connect
  bareos::client::director { $name_dir:
    password => $password,
  }

  bareos::client::messages { 'Standard':
    description => 'Send relevant messages to the Director.',
    director    => 'bareos-dir = all, !skipped, !restored',
  }
}
