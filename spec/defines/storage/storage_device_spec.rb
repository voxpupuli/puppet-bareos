require 'spec_helper'

describe 'bareos::storage::device' do
  let(:title) { 'name' }

  filename = '/etc/bareos/bareos-sd.d/device/name.conf'

  context 'with default values for all parameters will fail' do
    it { is_expected.to compile.and_raise_error(%r{.*}) }
  end

  context 'with required values' do
    let(:params) do
      {
        'archive_device'  => '/dev/tape',
        'media_type'      => 'DLT7000'
      }
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('bareos::storage') }
    it { is_expected.to contain_file(filename).with_content(%r{^Device \{$}) }
    it { is_expected.to contain_file(filename).with_content(%r{Name = "name"$}) }
    it { is_expected.to contain_file(filename).with_tag(['bareos', 'bareos_storage']) }
  end

  context 'with all params set' do
    res = BareosResourceHelper.new('Device')
    res.param('name', 'Name', 'name').
      param('description', 'Description', 'string').
      param('alert_command', 'Alert Command', 'strname').
      param('always_open', 'Always Open', 'bit').
      param('archive_device', 'Archive Device', 'strname').
      param('auto_deflate', 'Auto Deflate', 'io_direction').
      param('auto_deflate_algorithm', 'Auto Deflate Algorithm', 'compression_algorithm').
      param('auto_deflate_level', 'Auto Deflate Level', 'pint16').
      param('auto_inflate', 'Auto Inflate', 'io_direction').
      param('auto_select', 'Auto Select', 'boolean').
      param('autochanger', 'Autochanger', 'bit').
      param('automatic_mount', 'Automatic Mount', 'bit').
      param('backward_space_file', 'Backward Space File', 'bit').
      param('backward_space_record', 'Backward Space Record', 'bit').
      param('block_checksum', 'Block Checksum', 'bit').
      param('block_positioning', 'Block Positioning', 'bit').
      param('bsf_at_eom', 'Bsf At Eom', 'bit').
      param('changer_command', 'Changer Command', 'strname').
      param('changer_device', 'Changer Device', 'strname').
      param('check_labels', 'Check Labels', 'bit').
      param('close_on_poll', 'Close On Poll', 'bit').
      param('collect_statistics', 'Collect Statistics', 'boolean').
      param('device_options', 'Device Options', 'string').
      param('device_type', 'Device Type', 'device_type').
      param('diagnostic_device', 'Diagnostic Device', 'strname').
      param('drive_crypto_enabled', 'Drive Crypto Enabled', 'boolean').
      param('drive_index', 'Drive Index', 'pint16').
      param('drive_tape_alert_enabled', 'Drive Tape Alert Enabled', 'boolean').
      param('fast_forward_space_file', 'Fast Forward Space File', 'bit').
      param('forward_space_file', 'Forward Space File', 'bit').
      param('forward_space_record', 'Forward Space Record', 'bit').
      param('hardware_end_of_file', 'Hardware End Of File', 'bit').
      param('hardware_end_of_medium', 'Hardware End Of Medium', 'bit').
      param('label_block_size', 'Label Block Size', 'pint32').
      param('label_media', 'Label Media', 'bit').
      param('label_type', 'Label Type', 'label').
      param('maximum_block_size', 'Maximum Block Size', 'max_blocksize').
      param('maximum_changer_wait', 'Maximum Changer Wait', 'time').
      param('maximum_concurrent_jobs', 'Maximum Concurrent Jobs', 'pint32').
      param('maximum_file_size', 'Maximum File Size', 'size64').
      param('maximum_job_spool_size', 'Maximum Job Spool Size', 'size64').
      param('maximum_network_buffer_size', 'Maximum Network Buffer Size', 'pint32').
      param('maximum_open_volumes', 'Maximum Open Volumes', 'pint32').
      param('maximum_open_wait', 'Maximum Open Wait', 'time').
      param('maximum_rewind_wait', 'Maximum Rewind Wait', 'time').
      param('maximum_spool_size', 'Maximum Spool Size', 'size64').
      param('media_type', 'Media Type', 'strname').
      param('minimum_block_size', 'Minimum Block Size', 'pint32').
      param('mount_command', 'Mount Command', 'strname').
      param('mount_point', 'Mount Point', 'strname').
      param('no_rewind_on_close', 'No Rewind On Close', 'boolean').
      param('offline_on_unmount', 'Offline On Unmount', 'bit').
      param('query_crypto_status', 'Query Crypto Status', 'boolean').
      param('random_access', 'Random Access', 'bit').
      param('removable_media', 'Removable Media', 'bit').
      param('requires_mount', 'Requires Mount', 'bit').
      param('spool_directory', 'Spool Directory', 'directory').
      param('two_eof', 'Two Eof', 'bit').
      param('unmount_command', 'Unmount Command', 'strname').
      param('use_mtiocget', 'Use Mtiocget', 'bit').
      param('volume_capacity', 'Volume Capacity', 'size64').
      param('volume_poll_interval', 'Volume Poll Interval', 'time')

    let(:params) { res.params }

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file(filename).with_content(res.content) }
    it do
      is_expected.to contain_file(filename).
        that_notifies('Service[bareos-sd]')
    end
  end

  context 'with ensure absent' do
    let(:params) { { 'ensure' => 'absent' } }

    it { is_expected.to contain_file(filename).with_ensure('absent') }
  end
end
