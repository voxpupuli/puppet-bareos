def get_defaults(_facts)
  ##
  ## basic settings
  ##
  config_directory        = '/etc/bareos'
  config_directory_mode   = '0755'
  config_file_mode        = '0660'
  config_group            = 'bareos'
  config_owner            = 'bareos'
  manage_user             = true

  ##
  ## repository settings
  ##
  manage_repository       = true
  repository_host         = :undef
  repository_key          = {}
  repository_password     = :undef
  repository_release      = '20'
  repository_ssl          = true
  repository_subscription = false
  repository_username     = :undef

  ##
  ## client settings
  ##
  enable_client           = true
  manage_client_package   = true
  manage_client_service   = true
  client_config           = {}
  client_config_directory = 'bareos-fd.d'
  client_packages         = [
    'bareos-filedaemon',
    'bareos-filedaemon-python-plugin',
  ]
  client_package_ensure   = 'present'
  client_service_enable   = true
  client_service_ensure   = 'running'
  client_service          = 'bareos-fd'

  ##
  ## console
  ##
  manage_console_package = true
  console_packages       = [ 'bareos-bconsole', ]
  console_package_ensure = 'present'

  ##
  ## monitor
  ##
  manage_monitor_package = true
  monitor_packages       = [ 'bareos-traymonitor', ]
  monitor_package_ensure = 'present'

  {
    'config_directory_mode' => config_directory_mode,
    'config_directory' => config_directory,
    'config_file_mode' => config_file_mode,
    'config_group' => config_group,
    'config_owner' => config_owner,
    'manage_user' => manage_user,

    'manage_repository' => manage_repository,
    'repository_host' => repository_host,
    'repository_key' => repository_key,
    'repository_password' => repository_password,
    'repository_release' => repository_release,
    'repository_ssl' => repository_ssl,
    'repository_subscription' => repository_subscription,
    'repository_username' => repository_username,

    'enable_client' => enable_client,
    'manage_client_package' => manage_client_package,
    'manage_client_service' => manage_client_service,
    'client_config' => client_config,
    'client_config_directory' => client_config_directory,
    'client_packages' => client_packages,
    'client_package_ensure' => client_package_ensure,
    'client_service_enable' => client_service_enable,
    'client_service_ensure' => client_service_ensure,
    'client_service' => client_service,

    'manage_console_package' => manage_console_package,
    'console_packages' => console_packages,
    'console_package_ensure' => console_package_ensure,

    'manage_monitor_package' => manage_monitor_package,
    'monitor_packages' => monitor_packages,
    'monitor_package_ensure' => monitor_package_ensure,
  }
end
