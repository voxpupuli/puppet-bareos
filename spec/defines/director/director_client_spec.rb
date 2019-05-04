require 'spec_helper'

describe 'bareos::director::client' do
  let(:title) { 'name' }

  filename = '/etc/bareos/bareos-dir.d/client/name.conf'

  context 'with default values for all parameters will fail' do
    it { is_expected.to compile.and_raise_error(%r{.*}) }
  end

  context 'with required values' do
    let(:params) { { 'password' => 'password', 'address' => '127.0.0.1' } }

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('bareos::director') }
    it { is_expected.to contain_file(filename).with_content(%r{^Client \{$}) }
    it { is_expected.to contain_file(filename).with_content(%r{Name = "name"$}) }
    it { is_expected.to contain_file(filename).with_tag(['bareos', 'bareos_director']) }
  end

  context 'with all params set' do
    res = BareosResourceHelper.new('Client')
    res.param('name', 'Name', 'name').
      param('description', 'Description', 'string').
      param('address', 'Address', 'string').
      param('auth_type', 'Auth Type', 'auth_type').
      param('auto_prune', 'Auto Prune', 'boolean').
      param('catalog', 'Catalog', 'res').
      param('connection_from_client_to_director', 'Connection From Client To Director', 'boolean').
      param('connection_from_director_to_client', 'Connection From Director To Client', 'boolean').
      param('enabled', 'Enabled', 'boolean').
      param('file_retention', 'File Retention', 'time').
      param('hard_quota', 'Hard Quota', 'size64').
      param('heartbeat_interval', 'Heartbeat Interval', 'time').
      param('job_retention', 'Job Retention', 'time').
      param('maximum_bandwidth_per_job', 'Maximum Bandwidth Per Job', 'speed').
      param('maximum_concurrent_jobs', 'Maximum Concurrent Jobs', 'pint32').
      param('ndmp_block_size', 'Ndmp Block Size', 'pint32').
      param('ndmp_log_level', 'Ndmp Log Level', 'pint32').
      param('ndmp_use_lmdb', 'Ndmp Use Lmdb', 'boolean').
      param('passive', 'Passive', 'boolean').
      param('password', 'Password', 'autopassword').
      param('port', 'Port', 'pint32').
      param('protocol', 'Protocol', 'auth_protocol_type').
      param('quota_include_failed_jobs', 'Quota Include Failed Jobs', 'boolean').
      param('soft_quota', 'Soft Quota', 'size64').
      param('soft_quota_grace_period', 'Soft Quota Grace Period', 'time').
      param('strict_quotas', 'Strict Quotas', 'boolean').
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
      param('username', 'Username', 'string')

    let(:params) { res.params }
    # required resources
    let(:pre_condition) do
      '
      bareos::director::catalog { "name":
        db_driver => "sqlite3",
        db_name   => "test",
      }
      '
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file(filename).with_content(res.content) }
    it do
      is_expected.to contain_file(filename).
        that_notifies('Service[bareos-dir]').
        that_requires('Bareos::Director::Catalog[name]')
    end
  end

  context 'with ensure absent' do
    let(:params) { { 'ensure' => 'absent' } }

    it { is_expected.to contain_file(filename).with_ensure('absent') }
  end
end
