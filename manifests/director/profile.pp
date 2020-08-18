# == Define: bareos::director::profile
# The Profile Resource defines a set of ACLs.
# Console Resources can be tight to one or more profiles, making it easier to use a common set of ACLs.
#
# == Parameters
# [*ensure*]
#   present or absent the config file.
#
# [*catalog_acl*]
#   Catalog ACL: Lists the Catalog resources, this resource has access to. The special keyword *all* allows access to all Catalog resources.
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# [*client_acl*]
#   Client ACL: Lists the Client resources, this resource has access to. The special keyword *all* allows access to all Client resources.
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# [*command_acl*]
#   Command ACL: Lists the commands, this resource has access to. The special keyword *all* allows using commands.
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# [*description*]
#   Description: Additional information about the resource. Only used for UIs.
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*file_set_acl*]
#   File Set ACL: Lists the File Set resources, this resource has access to. The special keyword *all* allows access to all File Set resources.
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# [*job_acl*]
#   Job ACL: Lists the Job resources, this resource has access to. The special keyword *all* allows access to all Job resources.
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# [*plugin_options_acl*]
#   Plugin Options ACL: Specifies the allowed plugin options. An empty strings allows all Plugin Options.
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# [*pool_acl*]
#   Pool ACL: Lists the Pool resources, this resource has access to. The special keyword *all* allows access to all Pool resources.
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# [*schedule_acl*]
#   Schedule ACL: Lists the Schedule resources, this resource has access to. The special keyword *all* allows access to all Schedule resources.
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# [*storage_acl*]
#   Storage ACL: Lists the Storage resources, this resource has access to. The special keyword *all* allows access to all Storage resources.
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# [*where_acl*]
#   Where ACL: Specifies the base directories, where files could be restored. An empty string allows restores to all directories.
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
define bareos::director::profile (
  $ensure = present,
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
  include ::bareos::director

  $_resource = 'Profile'
  $_resource_dir = 'profile'

  unless $ensure in [ 'present', 'absent' ] {
    fail('Invalid value for ensure')
  }

  if $ensure == 'present' {
    $_settings = bareos_settings(
      [$name, 'Name', 'name', true],
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

  file { "${::bareos::director::config_dir}/${_resource_dir}/${name}.conf":
    ensure  => $ensure,
    mode    => $bareos::file_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    content => template('bareos/resource.erb'),
    notify  => Service[$bareos::director::service_name],
    tag     => ['bareos', 'bareos_director'],
  }
}
