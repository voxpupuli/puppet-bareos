require 'spec_helper'

describe 'bareos::client::client' do
  filename = '/etc/bareos/bareos-fd.d/client/bareos-fd.conf'

  context 'with default values for all parameters' do
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('bareos::client') }
    it { is_expected.to contain_file(filename).with_content(%r{^Client \{$}) }
    it { is_expected.to contain_file(filename).with_content(%r{Name = "bareos-fd"$}) }
    it { is_expected.to contain_file(filename).with_tag(['bareos', 'bareos_client']) }
  end

  context 'with all params set' do
    res = BareosResourceHelper.new('Client')
    res.param('name_client', 'Name', 'name').param_val('name_client', 'bareos-fd', '"bareos-fd"').
      param('description', 'Description', 'string').
      param('absolute_job_timeout', 'Absolute Job Timeout', 'pint32').
      param('allow_bandwidth_bursting', 'Allow Bandwidth Bursting', 'boolean').
      param('allowed_job_command', 'Allowed Job Command', 'string_list').
      param('allowed_script_dir', 'Allowed Script Dir', 'directory_list').
      param('always_use_lmdb', 'Always Use Lmdb', 'boolean').
      param('compatible', 'Compatible', 'boolean').
      param('fd_address', 'Fd Address', 'address').
      param('fd_addresses', 'Fd Addresses', 'addresses').
      param('fd_port', 'Fd Port', 'port').
      param('fd_source_address', 'Fd Source Address', 'address').
      param('heartbeat_interval', 'Heartbeat Interval', 'time').
      param('lmdb_threshold', 'Lmdb Threshold', 'pint32').
      param('log_timestamp_format', 'Log Timestamp Format', 'string').
      param('maximum_bandwidth_per_job', 'Maximum Bandwidth Per Job', 'speed').
      param('maximum_concurrent_jobs', 'Maximum Concurrent Jobs', 'pint32').
      param('maximum_connections', 'Maximum Connections', 'pint32').
      param('maximum_network_buffer_size', 'Maximum Network Buffer Size', 'pint32').
      param('messages', 'Messages', 'res').
      param('pid_directory', 'Pid Directory', 'directory').
      param('pki_cipher', 'Pki Cipher', 'encryption_cipher').
      param('pki_encryption', 'Pki Encryption', 'boolean').
      param('pki_key_pair', 'Pki Key Pair', 'directory').
      param('pki_master_key', 'Pki Master Key', 'directory_list').
      param('pki_signatures', 'Pki Signatures', 'boolean').
      param('pki_signer', 'Pki Signer', 'directory_list').
      param('plugin_directory', 'Plugin Directory', 'directory').
      param('plugin_names', 'Plugin Names', 'plugin_names').
      param('scripts_directory', 'Scripts Directory', 'directory').
      param('sd_connect_timeout', 'Sd Connect Timeout', 'time').
      param('secure_erase_command', 'Secure Erase Command', 'string').
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
      bareos::client::messages { "name":}
      '
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file(filename).with_content(res.content) }
    it do
      is_expected.to contain_file(filename).
        that_notifies('Service[bareos-fd]').
        that_requires('Bareos::Client::Messages[name]')
    end
  end

  context 'ensure absent' do
    let(:params) { { 'ensure' => 'absent' } }

    it { is_expected.to contain_file(filename).with_ensure('absent') }
  end
end
