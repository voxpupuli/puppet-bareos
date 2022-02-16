# == Define: bareos::director::jobdefs
# JobDefs are optional resources for providing defaults for Job resources.
# Almost the same like `Job`.
#
# == Parameters
# [*ensure*]
#   present or absent the config file.
#
# [*accurate*]
#   Accurate
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*add_prefix*]
#   Add Prefix
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*add_suffix*]
#   Add Suffix
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*allow_duplicate_jobs*]
#   Allow Duplicate Jobs
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*allow_higher_duplicates*]
#   Allow Higher Duplicates
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*allow_mixed_priority*]
#   Allow Mixed Priority
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*always_incremental*]
#   Always Incremental: Enable/disable always incremental backup scheme.
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*always_incremental_job_retention*]
#   Always Incremental Job Retention: Backup Jobs older than the specified time duration will be merged into a new Virtual backup.
#
#   Bareos Datatype: time
#   Bareos Default: 0
#   Required: false
#
# [*always_incremental_keep_number*]
#   Always Incremental Keep Number: Guarantee that at least the specified number of Backup Jobs will persist, even if they are older than "Always Incremental Job Retention".
#
#   Bareos Datatype: pint32
#   Bareos Default: 0
#   Required: false
#
# [*always_incremental_max_full_age*]
#   Always Incremental Max Full Age: If "AlwaysIncrementalMaxFullAge" is set, during consolidations only incremental backups will be considered while the Full Backup remains to reduce the amount of data being consolidated. Only if the Full Backup is older than "AlwaysIncrementalMaxFullAge", the Full Backup will be part of the consolidation to avoid the Full Backup becoming too old .
#
#   Bareos Datatype: time
#   Bareos Default: Not set
#   Required: false
#
# [*backup_format*]
#   Backup Format
#
#   Bareos Datatype: string
#   Bareos Default: Native
#   Required: false
#
# [*base*]
#   Base
#
#   May be specified as Array.
#   Bareos Datatype: resource_list
#   Bareos Default: Not set
#   Required: false
#
# [*bootstrap*]
#   Bootstrap
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# [*cancel_lower_level_duplicates*]
#   Cancel Lower Level Duplicates
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*cancel_queued_duplicates*]
#   Cancel Queued Duplicates
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*cancel_running_duplicates*]
#   Cancel Running Duplicates
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*catalog*]
#   Catalog
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*client*]
#   Client
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*client_run_after_job*]
#   Client Run After Job
#
#   Bareos Datatype: runscript_short
#   Bareos Default: Not set
#   Required: false
#
# [*client_run_before_job*]
#   Client Run Before Job
#
#   Bareos Datatype: runscript_short
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
# [*differential_backup_pool*]
#   Differential Backup Pool
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*differential_max_runtime*]
#   Differential Max Runtime
#
#   Bareos Datatype: time
#   Bareos Default: Not set
#   Required: false
#
# [*dir_plugin_options*]
#   Dir Plugin Options
#
#   May be specified as Array.
#   Bareos Datatype: string_list
#   Bareos Default: Not set
#   Required: false
#
# [*enabled*]
#   Enabled: En- or disable this resource.
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*fd_plugin_options*]
#   Fd Plugin Options
#
#   May be specified as Array.
#   Bareos Datatype: string_list
#   Bareos Default: Not set
#   Required: false
#
# [*file_history_size*]
#   File History Size
#
#   Bareos Datatype: size64
#   Bareos Default: 10000000
#   Required: false
#
# [*file_set*]
#   File Set
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*full_backup_pool*]
#   Full Backup Pool
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*full_max_runtime*]
#   Full Max Runtime
#
#   Bareos Datatype: time
#   Bareos Default: Not set
#   Required: false
#
# [*incremental_backup_pool*]
#   Incremental Backup Pool
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*incremental_max_runtime*]
#   Incremental Max Runtime
#
#   Bareos Datatype: time
#   Bareos Default: Not set
#   Required: false
#
# [*job_defs*]
#   Job Defs
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*job_to_verify*]
#   Job To Verify
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*level*]
#   Level
#
#   Bareos Datatype: backup_level
#   Bareos Default: Not set
#   Required: false
#
# [*max_concurrent_copies*]
#   Max Concurrent Copies
#
#   Bareos Datatype: pint32
#   Bareos Default: 100
#   Required: false
#
# [*max_diff_interval*]
#   Max Diff Interval
#
#   Bareos Datatype: time
#   Bareos Default: Not set
#   Required: false
#
# [*max_full_consolidations*]
#   Max Full Consolidations: If "AlwaysIncrementalMaxFullAge" is configured, do not run more than "MaxFullConsolidations" consolidation jobs that include the Full backup.
#
#   Bareos Datatype: pint32
#   Bareos Default: 0
#   Required: false
#
# [*max_full_interval*]
#   Max Full Interval
#
#   Bareos Datatype: time
#   Bareos Default: Not set
#   Required: false
#
# [*max_run_sched_time*]
#   Max Run Sched Time
#
#   Bareos Datatype: time
#   Bareos Default: Not set
#   Required: false
#
# [*max_run_time*]
#   Max Run Time
#
#   Bareos Datatype: time
#   Bareos Default: Not set
#   Required: false
#
# [*max_start_delay*]
#   Max Start Delay
#
#   Bareos Datatype: time
#   Bareos Default: Not set
#   Required: false
#
# [*max_virtual_full_interval*]
#   Max Virtual Full Interval
#
#   Bareos Datatype: time
#   Bareos Default: Not set
#   Required: false
#
# [*max_wait_time*]
#   Max Wait Time
#
#   Bareos Datatype: time
#   Bareos Default: Not set
#   Required: false
#
# [*maximum_bandwidth*]
#   Maximum Bandwidth
#
#   Bareos Datatype: speed
#   Bareos Default: Not set
#   Required: false
#
# [*maximum_concurrent_jobs*]
#   Maximum Concurrent Jobs
#
#   Bareos Datatype: pint32
#   Bareos Default: 1
#   Required: false
#
# [*messages*]
#   Messages
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: true
#
# [*next_pool*]
#   Next Pool
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*pool*]
#   Pool
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: true
#
# [*prefer_mounted_volumes*]
#   Prefer Mounted Volumes
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*prefix_links*]
#   Prefix Links
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*priority*]
#   Priority
#
#   Bareos Datatype: pint32
#   Bareos Default: 10
#   Required: false
#
# [*protocol*]
#   Protocol
#
#   Bareos Datatype: protocol_type
#   Bareos Default: Native
#   Required: false
#
# [*prune_files*]
#   Prune Files
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*prune_jobs*]
#   Prune Jobs
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*prune_volumes*]
#   Prune Volumes
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*purge_migration_job*]
#   Purge Migration Job
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*regex_where*]
#   Regex Where
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*replace*]
#   Replace
#
#   Bareos Datatype: replace_option
#   Bareos Default: Always
#   Required: false
#
# [*rerun_failed_levels*]
#   Rerun Failed Levels
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*reschedule_interval*]
#   Reschedule Interval
#
#   Bareos Datatype: time
#   Bareos Default: 1800
#   Required: false
#
# [*reschedule_on_error*]
#   Reschedule On Error
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*reschedule_times*]
#   Reschedule Times
#
#   Bareos Datatype: pint32
#   Bareos Default: 5
#   Required: false
#
# [*run*]
#   Run
#
#   May be specified as Array.
#   Bareos Datatype: string_list
#   Bareos Default: Not set
#   Required: false
#
# [*run_after_failed_job*]
#   Run After Failed Job
#
#   Bareos Datatype: runscript_short
#   Bareos Default: Not set
#   Required: false
#
# [*run_after_job*]
#   Run After Job
#
#   Bareos Datatype: runscript_short
#   Bareos Default: Not set
#   Required: false
#
# [*run_before_job*]
#   Run Before Job
#
#   Bareos Datatype: runscript_short
#   Bareos Default: Not set
#   Required: false
#
# [*run_script*]
#   Run Script
#
#   Bareos Datatype: runscript
#   Bareos Default: Not set
#   Required: false
#
# [*save_file_history*]
#   Save File History
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*schedule_res*]
#   Schedule
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*sd_plugin_options*]
#   Sd Plugin Options
#
#   May be specified as Array.
#   Bareos Datatype: string_list
#   Bareos Default: Not set
#   Required: false
#
# [*selection_pattern*]
#   Selection Pattern
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*selection_type*]
#   Selection Type
#
#   Bareos Datatype: migration_type
#   Bareos Default: Not set
#   Required: false
#
# [*spool_attributes*]
#   Spool Attributes
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*spool_data*]
#   Spool Data
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*spool_size*]
#   Spool Size
#
#   Bareos Datatype: size64
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
# [*strip_prefix*]
#   Strip Prefix
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*type*]
#   Type
#
#   Bareos Datatype: job_type
#   Bareos Default: Not set
#   Required: true
#
# [*virtual_full_backup_pool*]
#   Virtual Full Backup Pool
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*where*]
#   Where
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# [*write_bootstrap*]
#   Write Bootstrap
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# [*write_verify_list*]
#   Write Verify List
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
define bareos::director::jobdefs (
  Bareos::Module::Ensure $ensure = present,
  Optional[Bareos::Boolean] $accurate = undef,
  Optional[String] $add_prefix = undef,
  Optional[String] $add_suffix = undef,
  Optional[Bareos::Boolean] $allow_duplicate_jobs = undef,
  Optional[Bareos::Boolean] $allow_higher_duplicates = undef,
  Optional[Bareos::Boolean] $allow_mixed_priority = undef,
  Optional[Bareos::Boolean] $always_incremental = undef,
  Optional[Bareos::Time] $always_incremental_job_retention = undef,
  Optional[Integer[0]] $always_incremental_keep_number = undef,
  Optional[Bareos::Time] $always_incremental_max_full_age = undef,
  Optional[String] $backup_format = undef,
  Optional[Bareos::List::Resource] $base = undef,
  Optional[String] $bootstrap = undef,
  Optional[Bareos::Boolean] $cancel_lower_level_duplicates = undef,
  Optional[Bareos::Boolean] $cancel_queued_duplicates = undef,
  Optional[Bareos::Boolean] $cancel_running_duplicates = undef,
  Optional[Bareos::Resource] $catalog = undef,
  Optional[Bareos::Resource] $client = undef,
  Optional[Bareos::List::String] $client_run_after_job = undef,
  Optional[Bareos::List::String] $client_run_before_job = undef,
  Optional[String] $description = undef,
  Optional[Bareos::Resource] $differential_backup_pool = undef,
  Optional[Bareos::Time] $differential_max_runtime = undef,
  Optional[Bareos::List::String] $dir_plugin_options = undef,
  Optional[Bareos::Boolean] $enabled = undef,
  Optional[Bareos::List::String] $fd_plugin_options = undef,
  Optional[Bareos::Size] $file_history_size = undef,
  Optional[Bareos::Resource] $file_set = undef,
  Optional[Bareos::Resource] $full_backup_pool = undef,
  Optional[Bareos::Time] $full_max_runtime = undef,
  Optional[Bareos::Resource] $incremental_backup_pool = undef,
  Optional[Bareos::Time] $incremental_max_runtime = undef,
  Optional[Bareos::Resource] $job_defs = undef,
  Optional[Bareos::Resource] $job_to_verify = undef,
  Optional[Bareos::Job::Level] $level = undef,
  Optional[Integer[0]] $max_concurrent_copies = undef,
  Optional[Bareos::Time] $max_diff_interval = undef,
  Optional[Integer[0]] $max_full_consolidations = undef,
  Optional[Bareos::Time] $max_full_interval = undef,
  Optional[Bareos::Time] $max_run_sched_time = undef,
  Optional[Bareos::Time] $max_run_time = undef,
  Optional[Bareos::Time] $max_start_delay = undef,
  Optional[Bareos::Time] $max_virtual_full_interval = undef,
  Optional[Bareos::Time] $max_wait_time = undef,
  Optional[Bareos::Speed] $maximum_bandwidth = undef,
  Optional[Integer[0]] $maximum_concurrent_jobs = undef,
  Optional[Bareos::Resource] $messages = undef,
  Optional[Bareos::Resource] $next_pool = undef,
  Optional[Bareos::Resource] $pool = undef,
  Optional[Bareos::Boolean] $prefer_mounted_volumes = undef,
  Optional[Bareos::Boolean] $prefix_links = undef,
  Optional[Integer[0]] $priority = undef,
  Optional[Bareos::Auth::Protocol] $protocol = undef,
  Optional[Bareos::Boolean] $prune_files = undef,
  Optional[Bareos::Boolean] $prune_jobs = undef,
  Optional[Bareos::Boolean] $prune_volumes = undef,
  Optional[Bareos::Boolean] $purge_migration_job = undef,
  Optional[String] $regex_where = undef,
  Optional[Bareos::Job::ReplaceOption] $replace = undef,
  Optional[Bareos::Boolean] $rerun_failed_levels = undef,
  Optional[Bareos::Time] $reschedule_interval = undef,
  Optional[Bareos::Boolean] $reschedule_on_error = undef,
  Optional[Integer[0]] $reschedule_times = undef,
  Optional[Bareos::List::String] $run = undef,
  Optional[Bareos::List::String] $run_after_failed_job = undef,
  Optional[Bareos::List::String] $run_after_job = undef,
  Optional[Bareos::List::String] $run_before_job = undef,
  Optional[Hash] $run_script = undef,
  Optional[Bareos::Boolean] $save_file_history = undef,
  Optional[Bareos::Resource] $schedule_res = undef,
  Optional[Bareos::List::String] $sd_plugin_options = undef,
  Optional[String] $selection_pattern = undef,
  Optional[Bareos::Job::MigrationType] $selection_type = undef,
  Optional[Bareos::Boolean] $spool_attributes = undef,
  Optional[Bareos::Boolean] $spool_data = undef,
  Optional[Bareos::Size] $spool_size = undef,
  Optional[Bareos::List::Resource] $storage = undef,
  Optional[String] $strip_prefix = undef,
  Optional[Bareos::Job::Type] $type = undef,
  Optional[Bareos::Resource] $virtual_full_backup_pool = undef,
  Optional[String] $where = undef,
  Optional[String] $write_bootstrap = undef,
  Optional[String] $write_verify_list = undef,
) {
  include bareos::director

  $_resource = 'JobDefs'
  $_resource_dir = 'jobdefs'

  if $ensure == 'present' {
    # set various resource dependencies
    $_require_res_catalog = $catalog ? { undef => undef, default => Bareos::Director::Catalog[$catalog] }
    $_require_res_client = $client ? { undef => undef, default => Bareos::Director::Client[$client] }
    $_require_res_file_set = $file_set ? { undef => undef, default => Bareos::Director::Fileset[$file_set] }
    # note: verify_job is an alias to job_to_verify
    $_jobs = delete_undef_values([$base, $job_to_verify])
    $_require_res_jobs = empty($_jobs) ? { false => Bareos::Director::Job[$_jobs], default => undef }
    $_require_res_job_defs = $job_defs ? { undef => undef, default => Bareos::Director::Jobdefs[$job_defs] }
    $_require_res_message = $messages ? { undef => undef, default => Bareos::Director::Messages[$messages] }
    # check all configured pools
    $_pools = delete_undef_values([$differential_backup_pool, $incremental_backup_pool, $next_pool,$pool, $virtual_full_backup_pool])
    $_require_res_pools = empty($_pools) ? { false => Bareos::Director::Pool[$_pools], default => undef }
    $_require_res_schedule = $schedule_res ? { undef => undef, default => Bareos::Director::Schedule[$schedule_res] }
    $_require_res_storage = $storage ? { undef => undef, default => Bareos::Director::Storage[$storage] }

    $_require_resource = delete_undef_values([
        $_require_res_catalog,
        $_require_res_client,
        $_require_res_file_set,
        $_require_res_jobs,
        $_require_res_job_defs,
        $_require_res_message,
        $_require_res_pools,
        $_require_res_schedule,
        $_require_res_storage,
    ])

    $_settings = bareos_settings( [$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$accurate, 'Accurate', 'boolean', false],
      [$add_prefix, 'Add Prefix', 'string', false],
      [$add_suffix, 'Add Suffix', 'string', false],
      [$allow_duplicate_jobs, 'Allow Duplicate Jobs', 'boolean', false],
      [$allow_higher_duplicates, 'Allow Higher Duplicates', 'boolean', false],
      [$allow_mixed_priority, 'Allow Mixed Priority', 'boolean', false],
      [$always_incremental, 'Always Incremental', 'boolean', false],
      [$always_incremental_job_retention, 'Always Incremental Job Retention', 'time', false],
      [$always_incremental_keep_number, 'Always Incremental Keep Number', 'pint32', false],
      [$always_incremental_max_full_age, 'Always Incremental Max Full Age', 'time', false],
      [$backup_format, 'Backup Format', 'string', false],
      [$base, 'Base', 'resource_list', false],
      [$bootstrap, 'Bootstrap', 'directory', false],
      [$cancel_lower_level_duplicates, 'Cancel Lower Level Duplicates', 'boolean', false],
      [$cancel_queued_duplicates, 'Cancel Queued Duplicates', 'boolean', false],
      [$cancel_running_duplicates, 'Cancel Running Duplicates', 'boolean', false],
      [$catalog, 'Catalog', 'res', false],
      [$client, 'Client', 'res', false],
      [$client_run_after_job, 'Client Run After Job', 'runscript_short', false],
      [$client_run_before_job, 'Client Run Before Job', 'runscript_short', false],
      [$differential_backup_pool, 'Differential Backup Pool', 'res', false],
      [$differential_max_runtime, 'Differential Max Runtime', 'time', false],
      [$dir_plugin_options, 'Dir Plugin Options', 'string_list', false],
      [$enabled, 'Enabled', 'boolean', false],
      [$fd_plugin_options, 'Fd Plugin Options', 'string_list', false],
      [$file_history_size, 'File History Size', 'size64', false],
      [$file_set, 'File Set', 'res', false],
      [$full_backup_pool, 'Full Backup Pool', 'res', false],
      [$full_max_runtime, 'Full Max Runtime', 'time', false],
      [$incremental_backup_pool, 'Incremental Backup Pool', 'res', false],
      [$incremental_max_runtime, 'Incremental Max Runtime', 'time', false],
      [$job_defs, 'Job Defs', 'res', false],
      [$job_to_verify, 'Job To Verify', 'res', false],
      [$level, 'Level', 'backup_level', false],
      [$max_concurrent_copies, 'Max Concurrent Copies', 'pint32', false],
      [$max_diff_interval, 'Max Diff Interval', 'time', false],
      [$max_full_consolidations, 'Max Full Consolidations', 'pint32', false],
      [$max_full_interval, 'Max Full Interval', 'time', false],
      [$max_run_sched_time, 'Max Run Sched Time', 'time', false],
      [$max_run_time, 'Max Run Time', 'time', false],
      [$max_start_delay, 'Max Start Delay', 'time', false],
      [$max_virtual_full_interval, 'Max Virtual Full Interval', 'time', false],
      [$max_wait_time, 'Max Wait Time', 'time', false],
      [$maximum_bandwidth, 'Maximum Bandwidth', 'speed', false],
      [$maximum_concurrent_jobs, 'Maximum Concurrent Jobs', 'pint32', false],
      [$messages, 'Messages', 'res', false],
      [$next_pool, 'Next Pool', 'res', false],
      [$pool, 'Pool', 'res', false],
      [$prefer_mounted_volumes, 'Prefer Mounted Volumes', 'boolean', false],
      [$prefix_links, 'Prefix Links', 'boolean', false],
      [$priority, 'Priority', 'pint32', false],
      [$protocol, 'Protocol', 'protocol_type', false],
      [$prune_files, 'Prune Files', 'boolean', false],
      [$prune_jobs, 'Prune Jobs', 'boolean', false],
      [$prune_volumes, 'Prune Volumes', 'boolean', false],
      [$purge_migration_job, 'Purge Migration Job', 'boolean', false],
      [$regex_where, 'Regex Where', 'string', false],
      [$replace, 'Replace', 'replace_option', false],
      [$rerun_failed_levels, 'Rerun Failed Levels', 'boolean', false],
      [$reschedule_interval, 'Reschedule Interval', 'time', false],
      [$reschedule_on_error, 'Reschedule On Error', 'boolean', false],
      [$reschedule_times, 'Reschedule Times', 'pint32', false],
      [$run, 'Run', 'string_list', false],
      [$run_after_failed_job, 'Run After Failed Job', 'runscript_short', false],
      [$run_after_job, 'Run After Job', 'runscript_short', false],
      [$run_before_job, 'Run Before Job', 'runscript_short', false],
      [$run_script, 'Run Script', 'runscript', false],
      [$save_file_history, 'Save File History', 'boolean', false],
      [$schedule_res, 'Schedule', 'res', false],
      [$sd_plugin_options, 'Sd Plugin Options', 'string_list', false],
      [$selection_pattern, 'Selection Pattern', 'string', false],
      [$selection_type, 'Selection Type', 'migration_type', false],
      [$spool_attributes, 'Spool Attributes', 'boolean', false],
      [$spool_data, 'Spool Data', 'boolean', false],
      [$spool_size, 'Spool Size', 'size64', false],
      [$storage, 'Storage', 'resource_list', false],
      [$strip_prefix, 'Strip Prefix', 'string', false],
      [$type, 'Type', 'job_type', false],
      [$virtual_full_backup_pool, 'Virtual Full Backup Pool', 'res', false],
      [$where, 'Where', 'directory', false],
      [$write_bootstrap, 'Write Bootstrap', 'directory', false],
      [$write_verify_list, 'Write Verify List', 'directory', false]
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
