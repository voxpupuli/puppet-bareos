require 'spec_helper'

describe 'bareos::storage::storage' do
  filename = '/etc/bareos/bareos-sd.d/storage/bareos-sd.conf'

  context 'with default values for all parameters' do
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('bareos::storage') }
    it { is_expected.to contain_file(filename).with_content(%r{^Storage \{$}) }
    it { is_expected.to contain_file(filename).with_content(%r{Name = "bareos-sd"$}) }
    it { is_expected.to contain_file(filename).with_tag(['bareos', 'bareos_storage']) }
  end

  context 'with all params set' do
    res = BareosResourceHelper.new('Storage')
    res.param('name_storage', 'Name', 'name').param_val('name_storage', 'bareos-sd', '"bareos-sd"').
      param('absolute_job_timeout', 'Absolute Job Timeout', 'pint32').
      param('allow_bandwidth_bursting', 'Allow Bandwidth Bursting', 'boolean').
      param('auto_x_flate_on_replication', 'Auto X Flate On Replication', 'boolean').
      param('backend_directory', 'Backend Directory', 'directory_list').
      param('client_connect_wait', 'Client Connect Wait', 'time').
      param('collect_device_statistics', 'Collect Device Statistics', 'boolean').
      param('collect_job_statistics', 'Collect Job Statistics', 'boolean').
      param('compatible', 'Compatible', 'boolean').
      param('device_reserve_by_media_type', 'Device Reserve By Media Type', 'boolean').
      param('fd_connect_timeout', 'Fd Connect Timeout', 'time').
      param('file_device_concurrent_read', 'File Device Concurrent Read', 'boolean').
      param('heartbeat_interval', 'Heartbeat Interval', 'time').
      param('log_timestamp_format', 'Log Timestamp Format', 'string').
      param('maximum_bandwidth_per_job', 'Maximum Bandwidth Per Job', 'speed').
      param('maximum_concurrent_jobs', 'Maximum Concurrent Jobs', 'pint32').
      param('maximum_connections', 'Maximum Connections', 'pint32').
      param('maximum_network_buffer_size', 'Maximum Network Buffer Size', 'pint32').
      param('messages', 'Messages', 'res').
      param('ndmp_address', 'Ndmp Address', 'address').
      param('ndmp_addresses', 'Ndmp Addresses', 'addresses').
      param('ndmp_enable', 'Ndmp Enable', 'boolean').
      param('ndmp_log_level', 'Ndmp Log Level', 'pint32').
      param('ndmp_port', 'Ndmp Port', 'port').
      param('ndmp_snooping', 'Ndmp Snooping', 'boolean').
      param('pid_directory', 'Pid Directory', 'directory').
      param('plugin_directory', 'Plugin Directory', 'directory').
      param('plugin_names', 'Plugin Names', 'plugin_names').
      param('scripts_directory', 'Scripts Directory', 'directory').
      param('sd_address', 'Sd Address', 'address').
      param('sd_addresses', 'Sd Addresses', 'addresses').
      param('sd_connect_timeout', 'Sd Connect Timeout', 'time').
      param('sd_port', 'Sd Port', 'port').
      param('sd_source_address', 'Sd Source Address', 'address').
      param('secure_erase_command', 'Secure Erase Command', 'string').
      param('statistics_collect_interval', 'Statistics Collect Interval', 'pint32').
      param('sub_sys_directory', 'Sub Sys Directory', 'directory').
      param('tls_allowed_cn', 'Tls Allowed Cn', 'string_list').
      param('tls_authenticate', 'Tls Authenticate', 'boolean').
      param('tls_ca_certificate_dir', 'Tls Ca Certificate Dir', 'directory').
      param('tls_ca_certificate_file', 'Tls Ca Certificate File', 'directory').
      param('tls_certificate', 'Tls Certificate', 'directory').
      param('tls_certificate_revocation_list', 'Tls Certificate Revocation List', 'directory').
      param('tls_cipher_list', 'Tls Cipher List', 'string').
      param('tls_dh_file', 'Tls Dh File', 'directory').
      param('tls_enable', 'Tls Enable', 'boolean').
      param('tls_key', 'Tls Key', 'directory').
      param('tls_require', 'Tls Require', 'boolean').
      param('tls_verify_peer', 'Tls Verify Peer', 'boolean').
      param('ver_id', 'Ver Id', 'string').
      param('working_directory', 'Working Directory', 'directory')

    let(:params) { res.params }
    # required resources
    let(:pre_condition) do
      '
      bareos::storage::messages { "name":}
      '
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file(filename).with_content(res.content) }
    it do
      is_expected.to contain_file(filename).
        that_notifies('Service[bareos-sd]').
        that_requires('Bareos::Storage::Messages[name]')
    end
  end

  context 'ensure absent' do
    let(:params) { { 'ensure' => 'absent' } }

    it { is_expected.to contain_file(filename).with_ensure('absent') }
  end
end
