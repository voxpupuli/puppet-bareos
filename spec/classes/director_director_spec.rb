require 'spec_helper'

describe 'bareos::director::director' do
  filename = '/etc/bareos/bareos-dir.d/director/bareos-dir.conf'

  context 'with default values for all parameters' do
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('bareos::director') }
    it { is_expected.to contain_file(filename).with_content(%r{^Director \{$}) }
    it { is_expected.to contain_file(filename).with_content(%r{Name = "bareos-dir"$}) }
    it { is_expected.to contain_file(filename).with_tag(['bareos', 'bareos_director']) }
  end

  context 'with all params set' do
    res = BareosResourceHelper.new('Director')
    res.param('name_director', 'Name', 'name').param_val('name_director', 'bareos-dir', '"bareos-dir"').
      param('description', 'Description', 'string').
      param('absolute_job_timeout', 'Absolute Job Timeout', 'pint32').
      param('audit_events', 'Audit Events', 'audit_command_list').
      param('auditing', 'Auditing', 'boolean').
      param('backend_directory', 'Backend Directory', 'directory_list').
      param('dir_address', 'Dir Address', 'address').
      param('dir_addresses', 'Dir Addresses', 'addresses').
      param('dir_port', 'Dir Port', 'port').
      param('dir_source_address', 'Dir Source Address', 'address').
      param('fd_connect_timeout', 'Fd Connect Timeout', 'time').
      param('heartbeat_interval', 'Heartbeat Interval', 'time').
      param('key_encryption_key', 'Key Encryption Key', 'autopassword').
      param('log_timestamp_format', 'Log Timestamp Format', 'string').
      param('maximum_concurrent_jobs', 'Maximum Concurrent Jobs', 'pint32').
      param('maximum_connections', 'Maximum Connections', 'pint32').
      param('maximum_console_connections', 'Maximum Console Connections', 'pint32').
      param('messages', 'Messages', 'res').
      param('ndmp_log_level', 'Ndmp Log Level', 'pint32').
      param('ndmp_snooping', 'Ndmp Snooping', 'boolean').
      param('omit_defaults', 'Omit Defaults', 'boolean').
      param('optimize_for_size', 'Optimize For Size', 'boolean').
      param('optimize_for_speed', 'Optimize For Speed', 'boolean').
      param('password', 'Password', 'autopassword').
      param('pid_directory', 'Pid Directory', 'directory').
      param('plugin_directory', 'Plugin Directory', 'directory').
      param('plugin_names', 'Plugin Names', 'plugin_names').
      param('query_file', 'Query File', 'directory').
      param('scripts_directory', 'Scripts Directory', 'directory').
      param('sd_connect_timeout', 'Sd Connect Timeout', 'time').
      param('secure_erase_command', 'Secure Erase Command', 'string').
      param('statistics_collect_interval', 'Statistics Collect Interval', 'pint32').
      param('statistics_retention', 'Statistics Retention', 'time').
      param('subscriptions', 'Subscriptions', 'pint32').
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
      bareos::director::messages { "name":}
      '
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file(filename).with_content(res.content) }
    it do
      is_expected.to contain_file(filename).
        that_notifies('Service[bareos-dir]').
        that_requires('Bareos::Director::Messages[name]')
    end
  end

  context 'ensure absent' do
    let(:params) { { 'ensure' => 'absent' } }

    it { is_expected.to contain_file(filename).with_ensure('absent') }
  end
end
