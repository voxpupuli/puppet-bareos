require 'spec_helper'

describe 'bareos::director::jobdefs' do
  let(:title) { 'name' }

  filename = '/etc/bareos/bareos-dir.d/jobdefs/name.conf'

  context 'with default values for all parameters will fail' do
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('bareos::director') }
    it { is_expected.to contain_file(filename).with_content(%r{^JobDefs \{$}) }
    it { is_expected.to contain_file(filename).with_content(%r{Name = "name"$}) }
    it { is_expected.to contain_file(filename).with_tag(['bareos', 'bareos_director']) }
  end

  context 'with all params set' do
    res = BareosResourceHelper.new('JobDefs')
    res.param('name', 'Name', 'name').
      param('description', 'Description', 'string').
      param('accurate', 'Accurate', 'boolean').
      param('add_prefix', 'Add Prefix', 'string').
      param('add_suffix', 'Add Suffix', 'string').
      param('allow_duplicate_jobs', 'Allow Duplicate Jobs', 'boolean').
      param('allow_higher_duplicates', 'Allow Higher Duplicates', 'boolean').
      param('allow_mixed_priority', 'Allow Mixed Priority', 'boolean').
      param('always_incremental', 'Always Incremental', 'boolean').
      param('always_incremental_job_retention', 'Always Incremental Job Retention', 'time').
      param('always_incremental_keep_number', 'Always Incremental Keep Number', 'pint32').
      param('always_incremental_max_full_age', 'Always Incremental Max Full Age', 'time').
      param('backup_format', 'Backup Format', 'string').
      param('base', 'Base', 'resource_list').param_val('base', 'name2', '"name2"').
      param('bootstrap', 'Bootstrap', 'directory').
      param('cancel_lower_level_duplicates', 'Cancel Lower Level Duplicates', 'boolean').
      param('cancel_queued_duplicates', 'Cancel Queued Duplicates', 'boolean').
      param('cancel_running_duplicates', 'Cancel Running Duplicates', 'boolean').
      param('catalog', 'Catalog', 'res').
      param('client', 'Client', 'res').
      param('client_run_after_job', 'Client Run After Job', 'runscript_short').
      param('client_run_before_job', 'Client Run Before Job', 'runscript_short').
      param('differential_backup_pool', 'Differential Backup Pool', 'res').
      param('differential_max_runtime', 'Differential Max Runtime', 'time').
      param('dir_plugin_options', 'Dir Plugin Options', 'string_list').
      param('enabled', 'Enabled', 'boolean').
      param('fd_plugin_options', 'Fd Plugin Options', 'string_list').
      param('file_history_size', 'File History Size', 'size64').
      param('file_set', 'File Set', 'res').
      param('full_backup_pool', 'Full Backup Pool', 'res').
      param('full_max_runtime', 'Full Max Runtime', 'time').
      param('incremental_backup_pool', 'Incremental Backup Pool', 'res').
      param('incremental_max_runtime', 'Incremental Max Runtime', 'time').
      param('job_defs', 'Job Defs', 'res').param_val('job_defs', 'name2', '"name2"').
      param('job_to_verify', 'Job To Verify', 'res').param_val('job_to_verify', 'name2', '"name2"').
      param('level', 'Level', 'backup_level').
      param('max_concurrent_copies', 'Max Concurrent Copies', 'pint32').
      param('max_diff_interval', 'Max Diff Interval', 'time').
      param('max_full_consolidations', 'Max Full Consolidations', 'pint32').
      param('max_full_interval', 'Max Full Interval', 'time').
      param('max_run_sched_time', 'Max Run Sched Time', 'time').
      param('max_run_time', 'Max Run Time', 'time').
      param('max_start_delay', 'Max Start Delay', 'time').
      param('max_virtual_full_interval', 'Max Virtual Full Interval', 'time').
      param('max_wait_time', 'Max Wait Time', 'time').
      param('maximum_bandwidth', 'Maximum Bandwidth', 'speed').
      param('maximum_concurrent_jobs', 'Maximum Concurrent Jobs', 'pint32').
      param('messages', 'Messages', 'res').
      param('next_pool', 'Next Pool', 'res').
      param('pool', 'Pool', 'res').
      param('prefer_mounted_volumes', 'Prefer Mounted Volumes', 'boolean').
      param('prefix_links', 'Prefix Links', 'boolean').
      param('priority', 'Priority', 'pint32').
      param('protocol', 'Protocol', 'protocol_type').
      param('prune_files', 'Prune Files', 'boolean').
      param('prune_jobs', 'Prune Jobs', 'boolean').
      param('prune_volumes', 'Prune Volumes', 'boolean').
      param('purge_migration_job', 'Purge Migration Job', 'boolean').
      param('regex_where', 'Regex Where', 'string').
      param('replace', 'Replace', 'replace_option').
      param('rerun_failed_levels', 'Rerun Failed Levels', 'boolean').
      param('reschedule_interval', 'Reschedule Interval', 'time').
      param('reschedule_on_error', 'Reschedule On Error', 'boolean').
      param('reschedule_times', 'Reschedule Times', 'pint32').
      param('run', 'Run', 'string_list').
      param('run_after_failed_job', 'Run After Failed Job', 'runscript_short').
      param('run_after_job', 'Run After Job', 'runscript_short').
      param('run_before_job', 'Run Before Job', 'runscript_short').
      param('run_script', 'Run Script', 'runscript').
      param('save_file_history', 'Save File History', 'boolean').
      param('schedule_res', 'Schedule', 'res').
      param('sd_plugin_options', 'Sd Plugin Options', 'string_list').
      param('selection_pattern', 'Selection Pattern', 'string').
      param('selection_type', 'Selection Type', 'migration_type').
      param('spool_attributes', 'Spool Attributes', 'boolean').
      param('spool_data', 'Spool Data', 'boolean').
      param('spool_size', 'Spool Size', 'size64').
      param('storage', 'Storage', 'resource_list').
      param('strip_prefix', 'Strip Prefix', 'string').
      param('type', 'Type', 'job_type').
      param('virtual_full_backup_pool', 'Virtual Full Backup Pool', 'res').
      param('where', 'Where', 'directory').
      param('write_bootstrap', 'Write Bootstrap', 'directory').
      param('write_verify_list', 'Write Verify List', 'directory')

    let(:params) { res.params }
    # required resources
    let(:pre_condition) do
      '
      bareos::director::pool { "name": }
      bareos::director::catalog { "name":
        db_driver => "sqlite3",
        db_name   => "test",
      }
      bareos::director::storage { "name":
        address => "127.0.0.1",
        device  => "Device",
        media_type => "File",
        password => "pw",
      }
      bareos::director::client { "name":
        address => "127.0.0.1",
        password => "pw",
      }
      bareos::director::fileset { "name": }
      bareos::director::schedule { "name": }
      bareos::director::messages { "name": }
      bareos::director::job { "name2":
        messages => "name",
        pool     => "name",
        type     => "backup",
      }
      bareos::director::jobdefs { "name2": }
      '
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file(filename).with_content(res.content) }
    it do
      is_expected.to contain_file(filename).
        that_notifies('Service[bareos-dir]').
        that_requires('Bareos::Director::Catalog[name]').
        that_requires('Bareos::Director::Storage[name]').
        that_requires('Bareos::Director::Schedule[name]').
        that_requires('Bareos::Director::Messages[name]').
        that_requires('Bareos::Director::Client[name]').
        that_requires('Bareos::Director::Fileset[name]').
        that_requires('Bareos::Director::Job[name2]').
        that_requires('Bareos::Director::Jobdefs[name2]').
        that_requires('Bareos::Director::Pool[name]')
    end
  end

  context 'with ensure absent' do
    let(:params) { { 'ensure' => 'absent' } }

    it { is_expected.to contain_file(filename).with_ensure('absent') }
  end
end
