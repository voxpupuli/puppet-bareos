# == Class: bareos::params
#
class bareos::params {
  $file_mode = '0660'
  $file_dir_mode = '0755'
  $file_owner = 'bareos'
  $file_group = 'bareos'
  $user_groups = []
  $config_dir = '/etc/bareos'
  $config_dir_webui = '/etc/bareos-webui'

  # service/package specific
  # bconsole
  $console_package_name = 'bareos-bconsole'

  # monitor
  $monitor_package_name = 'bareos-traymonitor'

  # director
  $director_package_name = [
    'bareos-director',
    'bareos-director-python-plugin',
    'bareos-database-common',
    'bareos-database-mysql',
    'bareos-database-postgresql',
    'bareos-database-sqlite3',
    'bareos-database-tools',
  ]
  $director_service_name = 'bareos-dir'
  $director_managed_dirs = ['catalog',
    'client',
    'console',
    'counter',
    'director',
    'fileset',
    'job',
    'jobdefs',
    'messages',
    'pool',
    'profile',
    'schedule',
    'storage',
  ]

  # filedaemon/client
  $client_package_name = ['bareos-filedaemon', 'bareos-filedaemon-python-plugin']
  $client_service_name = 'bareos-fd'

  # storage
  $storage_package_name = ['bareos-storage', 'bareos-storage-python-plugin', 'bareos-tools']
  $storage_service_name = 'bareos-sd'

  # webui
  $webui_package_name = 'bareos-webui'
  $webui_service_name = 'apache2'
}
