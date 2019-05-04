require 'spec_helper'

describe 'bareos::client::director' do
  let(:title) { 'name' }

  filename = '/etc/bareos/bareos-fd.d/director/name.conf'

  context 'with default values for all parameters will fail' do
    it { is_expected.to compile.and_raise_error(%r{.*}) }
  end

  context 'with required values' do
    let(:params) { { 'password' => 'password' } }

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('bareos::client') }
    it { is_expected.to contain_file(filename).with_content(%r{^Director \{$}) }
    it { is_expected.to contain_file(filename).with_content(%r{Name = "name"$}) }
    it { is_expected.to contain_file(filename).with_tag(['bareos', 'bareos_client']) }
  end

  context 'with all params set' do
    res = BareosResourceHelper.new('Director')
    res.param('name', 'Name', 'name').
      param('description', 'Description', 'string').
      param('address', 'Address', 'string').
      param('allowed_job_command', 'Allowed Job Command', 'string_list').
      param('allowed_script_dir', 'Allowed Script Dir', 'directory_list').
      param('connection_from_client_to_director', 'Connection From Client To Director', 'boolean').
      param('connection_from_director_to_client', 'Connection From Director To Client', 'boolean').
      param('maximum_bandwidth_per_job', 'Maximum Bandwidth Per Job', 'speed').
      param('monitor', 'Monitor', 'boolean').
      param('password', 'Password', 'md5password').
      param('port', 'Port', 'pint32').
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
      param('tls_verify_peer', 'Tls Verify Peer', 'boolean')

    let(:params) { res.params }

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file(filename).with_content(res.content) }
    it do
      is_expected.to contain_file(filename).
        that_notifies('Service[bareos-fd]')
    end
  end

  context 'with ensure absent' do
    let(:params) { { 'ensure' => 'absent' } }

    it { is_expected.to contain_file(filename).with_ensure('absent') }
  end
end
