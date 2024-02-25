# @summary 
#   Ready to use director with default configs
# @param password
# @param name_dir
# @param catalog_conf
# @param storage_address
# @param storage_password
#
class bareos::profile::director (
  String[1] $password = 'MyDirectorPasswordPleaseChange',
  String[1] $name_dir = 'bareos-dir',
  Hash $catalog_conf = {
    'db_driver' => 'postgresql',
    'db_name'   => 'bareos_mycatalog',
  },
  Stdlib::Host $storage_address = 'localhost',
  String[1] $storage_password = 'BareosStoragePleaseChangeMe',
) {
  # ensure bconsole is installed and can connect to director
  bareos::console::director { $name_dir:
    description => 'Bareos console credentials for local director',
    address     => 'localhost',
    password    => $password,
  }

  # configure director itself and set password
  class { 'bareos::director::director':
    messages => 'Daemon', # set in profile
    password => $password,
    auditing => true,
  }

  # create catalog resource
  create_resources('bareos::director::catalog', {
      'MyCatalog' => $catalog_conf,
    }
  )

  class { 'bareos::profile::director::storage':
    address  => $storage_address,
    password => $storage_password,
  }

  # Add all default configs
  include bareos::profile::director::client
  include bareos::profile::director::fileset
  include bareos::profile::director::jobdefs
  include bareos::profile::director::messages
  include bareos::profile::director::pool
  include bareos::profile::director::profile
  include bareos::profile::director::schedule
}
