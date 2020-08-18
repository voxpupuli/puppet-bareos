# == Define: bareos::director::counter
# The Counter Resource defines a counter variable that can be accessed by variable expansion used
# for creating Volume labels with the Label Format Dir Pool directive.
#
# == Parameters
# [*ensure*]
#   present or absent the config file.
#
# [*catalog*]
#   Catalog
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*description*]
#   Description
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*maximum*]
#   Maximum
#
#   Bareos Datatype: pint32
#   Bareos Default: 2147483647
#   Required: false
#
# [*minimum*]
#   Minimum
#
#   Bareos Datatype: int32
#   Bareos Default: 0
#   Required: false
#
# [*wrap_counter*]
#   Wrap Counter
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
define bareos::director::counter (
  $ensure = present,
  $catalog = undef,
  $description = undef,
  $maximum = undef,
  $minimum = undef,
  $wrap_counter = undef,
) {
  include ::bareos::director

  $_resource = 'Counter'
  $_resource_dir = 'counter'

  unless $ensure in [ 'present', 'absent' ] {
    fail('Invalid value for ensure')
  }

  if $ensure == 'present' {
    $_require_res_catalog = $catalog ? { undef => undef, default => Bareos::Director::Catalog[$catalog] }

    $_require_resource = delete_undef_values([
      $_require_res_catalog,
    ])

    $_settings = bareos_settings(
      [$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$catalog, 'Catalog', 'res', false],
      [$maximum, 'Maximum', 'pint32', false],
      [$minimum, 'Minimum', 'int32', false],
      [$wrap_counter, 'Wrap Counter', 'res', false]
    )
  } else {
    $_require_resource = undef
  }

  file { "${::bareos::director::config_dir}/${_resource_dir}/${name}.conf":
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
