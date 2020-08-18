# == Define: bareos::director::fileset
# To define the set of files to be backed up for each Client.
# You may have any number of FileSets but each Job will reference only one.
#
# == Parameters
# [*ensure*]
#   present or absent the config file.
#
# [*description*]
#   Description
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*enable_vss*]
#   Enable VSS
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*exclude*]
#   Exclude
#
#   Bareos Datatype: include_exclude_item
#   Bareos Default: Not set
#   Required: false
#
# [*ignore_file_set_changes*]
#   Ignore File Set Changes
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*include*]
#   Include
#
#   Bareos Datatype: include_exclude_item
#   Bareos Default: Not set
#   Required: false
#
define bareos::director::fileset (
  $ensure = present,
  $description = undef,
  $enable_vss = undef,
  $exclude = undef,
  $ignore_file_set_changes = undef,
  $include = undef,
) {
  include ::bareos::director

  $_resource = 'FileSet'
  $_resource_dir = 'fileset'

  unless $ensure in [ 'present', 'absent' ] {
    fail('Invalid value for ensure')
  }

  if $ensure == 'present' {
    $_settings = bareos_settings(
      [$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$enable_vss, 'Enable VSS', 'boolean', false],
      [$exclude, 'Exclude', 'include_exclude_item', false],
      [$ignore_file_set_changes, 'Ignore File Set Changes', 'boolean', false],
      [$include, 'Include', 'include_exclude_item', false]
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
