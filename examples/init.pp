include postgresql::server
$storage_password = 'Password of the storage instance'

postgresql::server::db { 'bareos_catalog':
  user     => 'dbuser',
  password => postgresql::postgresql_password('bareos_catalog', 'dbpass'),
}
# Install and configure an Director Server
-> class { 'bareos::profile::director':
  password         => 'Password of the director instance itself',
  storage_address  => 'localhost',
  storage_password => $storage_password,
  catalog_conf     => {
    'db_name'     => 'bareos_catalog',
    'db_address'  => '127.0.0.1',
    'db_port'     => 5432,
    'db_user'     => 'dbuser',
    'db_password' => 'dbpass',
  },
}

include bareos::profile::director::fileset
include bareos::profile::director::jobdefs

# add storage server to the same machine
class { 'bareos::profile::storage':
  password       => $storage_password,
  archive_device => '/var/lib/bareos/storage',
}

# add the client to the config
bareos::director::client { 'bareos-client':
  description => 'Your fancy client to backup',
  password    => 'MyClientPasswordPleaseChange',
  address     => 'localhost',
}

# Create an backup job by referencing to the jobDef template.
bareos::director::job { 'backup-bareos-client':
  job_defs => 'DefaultJob',
  client   => 'bareos-client', # which client to assign this job
}
