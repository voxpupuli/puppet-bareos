# @summary 
#   Defines a set of ACLs. Console Resources can be tied to one or more profiles, making it easier to use a common set of ACLs.
#
# @param ensure
#   present or absent the config file.
#
# @param catalog_acl
#   Catalog ACL: Lists the Catalog resources, this resource has access to. The special keyword *all* allows access to all Catalog resources.
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# @param client_acl
#   Client ACL: Lists the Client resources, this resource has access to. The special keyword *all* allows access to all Client resources.
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# @param command_acl
#   Command ACL: Lists the commands, this resource has access to. The special keyword *all* allows using commands.
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# @param description
#   Description: Additional information about the resource. Only used for UIs.
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# @param file_set_acl
#   File Set ACL: Lists the File Set resources, this resource has access to. The special keyword *all* allows access to all File Set resources.
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# @param job_acl
#   Job ACL: Lists the Job resources, this resource has access to. The special keyword *all* allows access to all Job resources.
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# @param plugin_options_acl
#   Plugin Options ACL: Specifies the allowed plugin options. An empty strings allows all Plugin Options.
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# @param pool_acl
#   Pool ACL: Lists the Pool resources, this resource has access to. The special keyword *all* allows access to all Pool resources.
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# @param schedule_acl
#   Schedule ACL: Lists the Schedule resources, this resource has access to. The special keyword *all* allows access to all Schedule resources.
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# @param storage_acl
#   Storage ACL: Lists the Storage resources, this resource has access to. The special keyword *all* allows access to all Storage resources.
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# @param where_acl
#   Where ACL: Specifies the base directories, where files could be restored. An empty string allows restores to all directories.
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
define bareos::director::profile (
  Enum['present','absent'] $ensure = present,
  $catalog_acl = undef,
  $client_acl = undef,
  $command_acl = undef,
  $description = undef,
  $file_set_acl = undef,
  $job_acl = undef,
  $plugin_options_acl = undef,
  $pool_acl = undef,
  $schedule_acl = undef,
  $storage_acl = undef,
  $where_acl = undef,
) {
  include bareos::director

  $_resource = 'Profile'
  $_resource_dir = 'profile'

  if $ensure == 'present' {
    $_settings = bareos_settings([$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$catalog_acl, 'Catalog ACL', 'acl', false],
      [$client_acl, 'Client ACL', 'acl', false],
      [$command_acl, 'Command ACL', 'acl', false],
      [$file_set_acl, 'File Set ACL', 'acl', false],
      [$job_acl, 'Job ACL', 'acl', false],
      [$plugin_options_acl, 'Plugin Options ACL', 'acl', false],
      [$pool_acl, 'Pool ACL', 'acl', false],
      [$schedule_acl, 'Schedule ACL', 'acl', false],
      [$storage_acl, 'Storage ACL', 'acl', false],
      [$where_acl, 'Where ACL', 'acl', false]
    )
  }

  file { "${bareos::director::config_dir}/${_resource_dir}/${name}.conf":
    ensure  => $ensure,
    mode    => $bareos::file_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    content => template('bareos/resource.erb'),
    notify  => Service[$bareos::director::service_name],
    tag     => ['bareos', 'bareos_director'],
  }
}
