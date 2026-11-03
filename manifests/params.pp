# @summary Parameter default setup for the Bareos module
#
class bareos::params {
  $file_mode = '0660'
  $file_dir_mode = '0755'
  $file_owner = 'bareos'
  $file_group = 'bareos'
  $config_dir = '/etc/bareos'
  $config_dir_webui = '/etc/bareos-webui'

  $python_plugin = $facts['os']['family'] ? {
    'Debian' => 'python3-plugin',
    default  => 'python-plugin',
  }

  # service/package specific
  # bconsole
  $console_package_name = 'bareos-bconsole'

  # monitor
  $monitor_package_name = 'bareos-traymonitor'

  # director
  $director_package_name = [
    'bareos-director',
    "bareos-director-${python_plugin}",
    'bareos-database-common',
    'bareos-database-postgresql',
    'bareos-database-tools',
  ]
  $director_service_name = 'bareos-dir'
  $director_managed_dirs = [
    'catalog',
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
    'user',
  ]

  # filedaemon/client
  $client_package_name = ['bareos-filedaemon', "bareos-filedaemon-${python_plugin}"]
  $client_service_name = 'bareos-fd'

  # storage
  $storage_package_name = ['bareos-storage', "bareos-storage-${python_plugin}", 'bareos-tools']
  $storage_service_name = 'bareos-sd'

  # webui
  $webui_package_name = 'bareos-webui'
  $webui_service_name = 'apache2'
}
