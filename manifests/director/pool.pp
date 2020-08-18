# == Define: bareos::director::pool
# To define the pool of Volumes that can be used for a particular Job.
# Most people use a single default Pool.
# However, if you have a large number of clients or volumes, you may want to have multiple Pools.
# Pools allow you to restrict a Job (or a Client) to use only a particular set of Volumes.
#
# == Parameters
# [*ensure*]
#   present or absent the config file.
#
# [*action_on_purge*]
#   Action On Purge
#
#   Bareos Datatype: action_on_purge
#   Bareos Default: Not set
#   Required: false
#
# [*auto_prune*]
#   Auto Prune
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*catalog*]
#   Catalog
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*catalog_files*]
#   Catalog Files
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*cleaning_prefix*]
#   Cleaning Prefix
#
#   Bareos Datatype: strname
#   Bareos Default: CLN
#   Required: false
#
# [*description*]
#   Description
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*file_retention*]
#   File Retention
#
#   Bareos Datatype: time
#   Bareos Default: Not set
#   Required: false
#
# [*job_retention*]
#   Job Retention
#
#   Bareos Datatype: time
#   Bareos Default: Not set
#   Required: false
#
# [*label_format*]
#   Label Format
#
#   Bareos Datatype: strname
#   Bareos Default: Not set
#   Required: false
#
# [*label_type*]
#   Label Type
#
#   Bareos Datatype: label
#   Bareos Default: Not set
#   Required: false
#
# [*maximum_block_size*]
#   Maximum Block Size
#
#   Bareos Datatype: pint32
#   Bareos Default: Not set
#   Required: false
#
# [*maximum_volume_bytes*]
#   Maximum Volume Bytes
#
#   Bareos Datatype: size64
#   Bareos Default: Not set
#   Required: false
#
# [*maximum_volume_files*]
#   Maximum Volume Files
#
#   Bareos Datatype: pint32
#   Bareos Default: Not set
#   Required: false
#
# [*maximum_volume_jobs*]
#   Maximum Volume Jobs
#
#   Bareos Datatype: pint32
#   Bareos Default: Not set
#   Required: false
#
# [*maximum_volumes*]
#   Maximum Volumes
#
#   Bareos Datatype: pint32
#   Bareos Default: Not set
#   Required: false
#
# [*migration_high_bytes*]
#   Migration High Bytes
#
#   Bareos Datatype: size64
#   Bareos Default: Not set
#   Required: false
#
# [*migration_low_bytes*]
#   Migration Low Bytes
#
#   Bareos Datatype: size64
#   Bareos Default: Not set
#   Required: false
#
# [*migration_time*]
#   Migration Time
#
#   Bareos Datatype: time
#   Bareos Default: Not set
#   Required: false
#
# [*minimum_block_size*]
#   Minimum Block Size
#
#   Bareos Datatype: pint32
#   Bareos Default: Not set
#   Required: false
#
# [*next_pool*]
#   Next Pool
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*pool_type*]
#   Pool Type
#
#   Bareos Datatype: pooltype
#   Bareos Default: Backup
#   Required: false
#
# [*purge_oldest_volume*]
#   Purge Oldest Volume
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*recycle*]
#   Recycle
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*recycle_current_volume*]
#   Recycle Current Volume
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*recycle_oldest_volume*]
#   Recycle Oldest Volume
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*recycle_pool*]
#   Recycle Pool
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*scratch_pool*]
#   Scratch Pool
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*storage*]
#   Storage
#
#   May be specified as Array.
#   Bareos Datatype: resource_list
#   Bareos Default: Not set
#   Required: false
#
# [*use_catalog*]
#   Use Catalog
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*volume_retention*]
#   Volume Retention
#
#   Bareos Datatype: time
#   Bareos Default: 31536000
#   Required: false
#
# [*volume_use_duration*]
#   Volume Use Duration
#
#   Bareos Datatype: time
#   Bareos Default: Not set
#   Required: false
#
define bareos::director::pool (
  $ensure = present,
  $action_on_purge = undef,
  $auto_prune = undef,
  $catalog = undef,
  $catalog_files = undef,
  $cleaning_prefix = undef,
  $description = undef,
  $file_retention = undef,
  $job_retention = undef,
  $label_format = undef,
  $label_type = undef,
  $maximum_block_size = undef,
  $maximum_volume_bytes = undef,
  $maximum_volume_files = undef,
  $maximum_volume_jobs = undef,
  $maximum_volumes = undef,
  $migration_high_bytes = undef,
  $migration_low_bytes = undef,
  $migration_time = undef,
  $minimum_block_size = undef,
  $next_pool = undef,
  $pool_type = undef,
  $purge_oldest_volume = undef,
  $recycle = undef,
  $recycle_current_volume = undef,
  $recycle_oldest_volume = undef,
  $recycle_pool = undef,
  $scratch_pool = undef,
  $storage = undef,
  $use_catalog = undef,
  $volume_retention = undef,
  $volume_use_duration = undef,
) {
  include ::bareos::director

  $_resource = 'Pool'
  $_resource_dir = 'pool'

  unless $ensure in [ 'present', 'absent' ] {
    fail('Invalid value for ensure')
  }

  if $ensure == 'present' {
    # set various resource dependencies
    $_require_res_catalog = $catalog ? { undef => undef, default => Bareos::Director::Catalog[$catalog] }
    # check all configured pools
    $_pools = delete_undef_values([$next_pool, $recycle_pool, $scratch_pool])
    $_require_res_pools = empty($_pools) ? { false => Bareos::Director::Pool[$_pools], default => undef }
    $_require_res_storage = $storage ? { undef => undef, default => Bareos::Director::Storage[$storage]}

    $_require_resource = delete_undef_values([
      $_require_res_catalog,
      $_require_res_pools,
      $_require_res_storage,
    ])

    $_settings = bareos_settings(
      [$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$action_on_purge, 'Action On Purge', 'action_on_purge', false],
      [$auto_prune, 'Auto Prune', 'boolean', false],
      [$catalog, 'Catalog', 'res', false],
      [$catalog_files, 'Catalog Files', 'boolean', false],
      [$cleaning_prefix, 'Cleaning Prefix', 'strname', false],
      [$file_retention, 'File Retention', 'time', false],
      [$job_retention, 'Job Retention', 'time', false],
      [$label_format, 'Label Format', 'strname', false],
      [$label_type, 'Label Type', 'label', false],
      [$maximum_block_size, 'Maximum Block Size', 'pint32', false],
      [$maximum_volume_bytes, 'Maximum Volume Bytes', 'size64', false],
      [$maximum_volume_files, 'Maximum Volume Files', 'pint32', false],
      [$maximum_volume_jobs, 'Maximum Volume Jobs', 'pint32', false],
      [$maximum_volumes, 'Maximum Volumes', 'pint32', false],
      [$migration_high_bytes, 'Migration High Bytes', 'size64', false],
      [$migration_low_bytes, 'Migration Low Bytes', 'size64', false],
      [$migration_time, 'Migration Time', 'time', false],
      [$minimum_block_size, 'Minimum Block Size', 'pint32', false],
      [$next_pool, 'Next Pool', 'res', false],
      [$pool_type, 'Pool Type', 'pooltype', false],
      [$purge_oldest_volume, 'Purge Oldest Volume', 'boolean', false],
      [$recycle, 'Recycle', 'boolean', false],
      [$recycle_current_volume, 'Recycle Current Volume', 'boolean', false],
      [$recycle_oldest_volume, 'Recycle Oldest Volume', 'boolean', false],
      [$recycle_pool, 'Recycle Pool', 'res', false],
      [$scratch_pool, 'Scratch Pool', 'res', false],
      [$storage, 'Storage', 'resource_list', false],
      [$use_catalog, 'Use Catalog', 'boolean', false],
      [$volume_retention, 'Volume Retention', 'time', false],
      [$volume_use_duration, 'Volume Use Duration', 'time', false]
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
