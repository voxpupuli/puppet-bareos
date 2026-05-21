# @summary Manage a Bareos Dir->User resource for the Director
#
# Each user who wants to login using PAM needs a dedicated User Resource in the Bareos Director
# configuration.  The main purpose is to configure ACLs; they are the same as in the Console and
# Profile resources.
#
# @param ensure
#   Whether the config file should be present or absent.
#
# @param catalog_acl
#   Catalog ACL
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# @param client_acl
#   Client ACL
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# @param command_acl
#   Command ACL
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# @param description
#   Description
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# @param file_set_acl
#   File Set ACL
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# @param job_acl
#   Job ACL
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# @param plugin_options_acl
#   Plugin Options ACL
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# @param pool_acl
#   Pool ACL
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# @param profile
#   Profile: Profiles can be assigned to a Console. ACL are checked until either a deny ACL is found or an allow ACL. First the console ACL is checked then any profile the console is linked to.
#
#   May be specified as Array.
#   Bareos Datatype: resource_list
#   Bareos Default: Not set
#   Required: false
#
# @param schedule_acl
#   Schedule ACL
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# @param storage_acl
#   Storage ACL
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# @param where_acl
#   Where ACL
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
define bareos::director::user (
  Enum['present', 'absent'] $ensure = present,
  Optional[Bareos::List] $catalog_acl = undef,
  Optional[Bareos::List] $client_acl = undef,
  Optional[Bareos::List] $command_acl = undef,
  Optional[String] $description = undef,
  Optional[Bareos::List] $file_set_acl = undef,
  Optional[Bareos::List] $job_acl = undef,
  Optional[Bareos::List] $plugin_options_acl = undef,
  Optional[Bareos::List] $pool_acl = undef,
  Optional[Bareos::List] $profile = undef,
  Optional[Bareos::List] $schedule_acl = undef,
  Optional[Bareos::List] $storage_acl = undef,
  Optional[Bareos::List] $where_acl = undef,
) {
  include bareos::director

  $_resource = 'User'
  $_resource_dir = 'user'

  if $ensure == 'present' {
    $_require_res_profiles = $profile ? { undef => undef, default => Bareos::Director::Profile[$profile] }

    $_require_resource = delete_undef_values([
      $_require_res_profiles,
    ])

    $_settings = bareos_settings([$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$catalog_acl, 'Catalog ACL', 'acl', false],
      [$client_acl, 'Client ACL', 'acl', false],
      [$command_acl, 'Command ACL', 'acl', false],
      [$file_set_acl, 'File Set ACL', 'acl', false],
      [$job_acl, 'Job ACL', 'acl', false],
      [$plugin_options_acl, 'Plugin Options ACL', 'acl', false],
      [$pool_acl, 'Pool ACL', 'acl', false],
      [$profile, 'Profile', 'resource_list', false],
      [$schedule_acl, 'Schedule ACL', 'acl', false],
      [$storage_acl, 'Storage ACL', 'acl', false],
      [$where_acl, 'Where ACL', 'acl', false]
    )
  } else {
    $_require_resource = undef
  }

  file { "${bareos::director::config_dir}/${_resource_dir}/${name}.conf":
    ensure  => $ensure,
    mode    => $bareos::file_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    content => template('bareos/resource.erb'),
    notify  => Service[$bareos::director::service_name],
    require => $_require_resource,
    tag     => ['bareos', 'bareos_director'],
  }
}
