# The baseline for module testing used by Puppet Labs is that each manifest
# should have a corresponding test manifest that declares that class or defined
# type.
#
# Tests are then run by using puppet apply --noop (to check for compilation
# errors and view a log of events) or by fully applying the test in a virtual
# environment (to compare the resulting system state to the desired state).
#
# Learn more about module testing here:
# https://docs.puppet.com/guides/tests_smoke.html
#

include postgresql::server

class { 'bareos': }

class { 'bareos::director::director':
  password => 'pw',
}

postgresql::server::db { 'bareos_catalog':
  user     => 'dbuser',
  password => postgresql::postgresql_password('bareos', 'dbpass'),
}
-> bareos::director::catalog { 'bareos_catalog':
  db_driver   => 'postgresql',
  db_name     => 'bareos_catalog',
  db_address  => '127.0.0.1',
  db_port     => 5432,
  db_user     => 'dbuser',
  db_password => 'dbpass',
}

class { 'bareos::client::client':
}
class { 'bareos::storage::storage':
}
include bareos::console
include bareos::monitor
