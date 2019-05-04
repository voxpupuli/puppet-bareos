require 'spec_helper'

describe 'bareos::director::pool' do
  let(:title) { 'name' }

  filename = '/etc/bareos/bareos-dir.d/pool/name.conf'

  context 'with default values for all parameters' do
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('bareos::director') }
    it { is_expected.to contain_file(filename).with_content(%r{^Pool \{$}) }
    it { is_expected.to contain_file(filename).with_content(%r{Name = "name"$}) }
    it { is_expected.to contain_file(filename).with_tag(['bareos', 'bareos_director']) }
  end

  context 'with all params set' do
    res = BareosResourceHelper.new('Pool')
    res.param('name', 'Name', 'name').
      param('description', 'Description', 'string').
      param('action_on_purge', 'Action On Purge', 'action_on_purge').
      param('auto_prune', 'Auto Prune', 'boolean').
      param('catalog', 'Catalog', 'res').
      param('catalog_files', 'Catalog Files', 'boolean').
      param('cleaning_prefix', 'Cleaning Prefix', 'strname').
      param('file_retention', 'File Retention', 'time').
      param('job_retention', 'Job Retention', 'time').
      param('label_format', 'Label Format', 'strname').
      param('label_type', 'Label Type', 'label').
      param('maximum_block_size', 'Maximum Block Size', 'pint32').
      param('maximum_volume_bytes', 'Maximum Volume Bytes', 'size64').
      param('maximum_volume_files', 'Maximum Volume Files', 'pint32').
      param('maximum_volume_jobs', 'Maximum Volume Jobs', 'pint32').
      param('maximum_volumes', 'Maximum Volumes', 'pint32').
      param('migration_high_bytes', 'Migration High Bytes', 'size64').
      param('migration_low_bytes', 'Migration Low Bytes', 'size64').
      param('migration_time', 'Migration Time', 'time').
      param('minimum_block_size', 'Minimum Block Size', 'pint32').
      param('next_pool', 'Next Pool', 'res').param_val('next_pool', 'next_pool', '"next_pool"').
      param('pool_type', 'Pool Type', 'pooltype').
      param('purge_oldest_volume', 'Purge Oldest Volume', 'boolean').
      param('recycle', 'Recycle', 'boolean').
      param('recycle_current_volume', 'Recycle Current Volume', 'boolean').
      param('recycle_oldest_volume', 'Recycle Oldest Volume', 'boolean').
      param('recycle_pool', 'Recycle Pool', 'res').param_val('recycle_pool', 'recycle_pool', '"recycle_pool"').
      param('scratch_pool', 'Scratch Pool', 'res').param_val('scratch_pool', 'scratch_pool', '"scratch_pool"').
      param('storage', 'Storage', 'resource_list').
      param('use_catalog', 'Use Catalog', 'boolean').
      param('volume_retention', 'Volume Retention', 'time').
      param('volume_use_duration', 'Volume Use Duration', 'time')

    let(:params) { res.params }
    # required resources
    let(:pre_condition) do
      '
      bareos::director::pool { ["next_pool", "recycle_pool", "scratch_pool"]: }
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
      '
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file(filename).with_content(res.content) }
    it do
      is_expected.to contain_file(filename).
        that_notifies('Service[bareos-dir]').
        that_requires('Bareos::Director::Catalog[name]').
        that_requires('Bareos::Director::Storage[name]').
        that_requires('Bareos::Director::Pool[next_pool]').
        that_requires('Bareos::Director::Pool[recycle_pool]').
        that_requires('Bareos::Director::Pool[scratch_pool]')
    end
  end

  context 'with ensure absent' do
    let(:params) { { 'ensure' => 'absent' } }

    it { is_expected.to contain_file(filename).with_ensure('absent') }
  end
end
