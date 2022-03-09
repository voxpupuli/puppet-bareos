# @summary This puppet module configures and manage all aspects of an complex bareos installation
#
# @author Richard Hillmann <richie@project0.de>
#
# @param repo_release
#   The major bareos release version which should be used
# @param repo_subscription
#   Activate the (paid) subscription repo. Otherwise the opensource repos will be selected
# @param repo_username
#   The major bareos release version which should be used
# @param repo_password
#   The major bareos release version which should be used
# @param manage_package
#   Whether puppet should handle the installation ob bareos packages
# @param manage_service
#   Whether puppet should activate the bareos system services
# @param manage_database
#   Whether puppet should call the bareos DB creation and configuration scripts
# @param package_ensure
#   Package version to be installed
# @param service_ensure
#   Service state which should be ensured
# @param service_enable
#   Whether puppet should enable the bareos services
# @param manage_repo
#   Whether puppet should manage the bareos package repository
# @param manage_user
#   Whether puppet should manage the bareos user
# @param package_name
#   Name of the package which should be installed
# @param director_service_allow_restart
#   Whether puppet is allowed to restart the director service. If not it will reload
#
class bareos (
  ##
  ## basic settings
  ##
                           $config_directory        = '/etc/bareos',
                           $config_directory_mode   = '0755',
                           $config_file_mode        = '0660',
                           $config_group            = 'bareos',
                           $config_owner            = 'bareos',
                           $manage_user             = true,


  ##
  ## repository settings
  ##
  Boolean                  $manage_repository       = true,
  Optional[Stdlib::Host]   $repository_host         = undef,
  Optional[Hash]           $repository_key          = {},
  Optional[String[1]]      $repository_password     = undef,
  Bareos::Version          $repository_release      = '20',
  Boolean                  $repository_ssl          = true,
  Boolean                  $repository_subscription = false,
  Optional[String[1]]      $repository_username     = undef,

  ##
  ## client settings
  ##
  Boolean                  $enable_client           = true,
  Boolean                  $manage_client_package   = true,
  Boolean                  $manage_client_service   = true,
  Hash                     $client_config           = {},
  String[1]                $client_config_directory = $bareos::params::client_config_directory,
  Array[String[1]]         $client_packages         = $bareos::params::client_packages,
  String[1]                $client_package_ensure   = $bareos::params::client_package_ensure,
  Boolean                  $client_service_enable   = $bareos::params::client_service_enable,
  String[1]                $client_service_ensure   = $bareos::params::client_service_ensure,
  String[1]                $client_service          = $bareos::params::client_service,

  ##
  ## console
  ##
  Boolean                  $manage_console_package   = true,
  Array[String[1]]         $console_packages         = $bareos::params::console_packages,
  String[1]                $console_package_ensure   = $bareos::params::console_package_ensure,

  ##
  ## monitor
  ##
  Boolean                  $manage_monitor_package   = true,
  Array[String[1]]         $monitor_packages         = $bareos::params::monitor_packages,
  String[1]                $monitor_package_ensure   = $bareos::params::monitor_package_ensure,

  ##
  ## webui
  ##
  Boolean                  $manage_webui_package           = $bareos::params::manage_webui_package,
  Array[String[1]]         $webui_packages                 = $bareos::params::webui_packages,
  String[1]                $webui_package_ensure           = $bareos::params::webui_package_ensure,

  Boolean                  $manage_webui_service           = $bareos::params::manage_webui_service,
  String[1]                $webui_service                  = $bareos::params::webui_service,
  Boolean                  $webui_service_enable           = $bareos::params::webui_service_enable,
  String[1]                $webui_service_ensure           = $bareos::params::webui_service_ensure,

  String[1]                $webui_config_directory         = $bareos::params::webui_config_directory,


  Boolean                  $webui_manage_local_director    = $bareos::params::webui_manage_local_director,
  Integer                  $webui_session_timeout          = $bareos::params::webui_session_timeout,
  String[1]                $webui_pagination_values        = $bareos::params::webui_pagination_values,
  Integer                  $webui_pagination_default_value = $bareos::params::webui_pagination_default_value,
  Boolean                  $webui_save_previous_state      = $bareos::params::webui_save_previous_state,
  String                   $webui_label_pooltype           = $bareos::params::webui_label_pooltype,
  Hash                     $webui_directors                = $bareos::params::webui_directors,
) inherits bareos::params {
  if $manage_repository {
    contain bareos::repository

    Class['bareos::repository'] -> Class['bareos::client']
  }

  contain bareos::client
  contain bareos::config
  contain bareos::console
  contain bareos::monitor
}
