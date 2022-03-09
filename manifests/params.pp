# @summary
#   define default values
#
class bareos::params {
  ##
  ## director
  ##
  $director_service_name = 'bareos-dir'
  $director_packages     = [
    'bareos-director',
    'bareos-director-python-plugin',
    'bareos-database-common',
    'bareos-database-mysql',
    'bareos-database-postgresql',
    'bareos-database-sqlite3',
    'bareos-database-tools',
  ]
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
  ]

  ##
  ## filedaemon/client
  ##
  $client_config_directory = "bareos-fd.d"
  $client_packages         = [
    'bareos-filedaemon',
    'bareos-filedaemon-python-plugin',
  ]
  $client_package_ensure   = present
  $client_service_enable   = true
  $client_service_ensure   = running
  $client_service_name     = 'bareos-fd'

  ##
  ## storage
  ##
  $storage_service_name = 'bareos-sd'
  $storage_packages     = [
    'bareos-storage',
    'bareos-storage-python-plugin',
    'bareos-tools',
  ]

  ##
  ## console
  ##
  $console_packages       = [
    'bareos-bconsole',
  ]
  $console_package_ensure = present

  ##
  ## monitor
  ##
  $monitor_packages       = [
    'bareos-traymonitor',
  ]
  $monitor_package_ensure = present


  ##
  ## webui
  ##
  $manage_webui_package = true
  $webui_package_ensure = present
  $webui_packages       = [
    'bareos-webui',
  ]


  $manage_webui_service  = true
  $webui_service         = 'apache2'
  $webui_service_enable  = true
  $webui_service_ensure  = running

  $webui_config_directory         = '/etc/bareos-webui'

  $webui_manage_local_director    = true
  $webui_session_timeout          = 3600
  $webui_pagination_values        = '10,25,50,100'
  $webui_pagination_default_value = 25
  $webui_save_previous_state      = false
  $webui_label_pooltype           = ''
  $webui_directors                = {}
}
