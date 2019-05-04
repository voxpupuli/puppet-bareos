require 'spec_helper'

describe 'bareos::console::console' do
  let(:title) { 'name' }

  filename = '/etc/bareos/bconsole.d/console/name.conf'

  context 'with default values for all parameters will fail' do
    it { is_expected.to compile.and_raise_error(%r{.*}) }
  end

  context 'with required values' do
    let(:params) { { 'password' => 'password' } }

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('bareos::console') }
    it { is_expected.to contain_file(filename).with_content(%r{^Console \{$}) }
    it { is_expected.to contain_file(filename).with_content(%r{Name = "name"$}) }
    it { is_expected.to contain_file(filename).with_tag(['bareos', 'bareos_console']) }
  end

  context 'with all params set' do
    res = BareosResourceHelper.new('Console')
    res.param('name', 'Name', 'name').
      param('description', 'Description', 'string').
      param('director', 'Director', 'string').
      param('heartbeat_interval', 'Heartbeat Interval', 'time').
      param('history_file', 'History File', 'directory').
      param('history_length', 'History Length', 'pint32').
      param('password', 'Password', 'md5password').
      param('rc_file', 'Rc File', 'directory').
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
  end

  context 'with ensure absent' do
    let(:params) { { 'ensure' => 'absent' } }

    it { is_expected.to contain_file(filename).with_ensure('absent') }
  end
end
