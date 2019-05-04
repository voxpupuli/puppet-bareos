require 'spec_helper'

describe 'bareos::director::console' do
  let(:title) { 'name' }

  filename = '/etc/bareos/bareos-dir.d/console/name.conf'

  context 'with default values for all parameters will fail' do
    it { is_expected.to compile.and_raise_error(%r{.*}) }
  end

  context 'with required values' do
    let(:params) do
      {
        'password' => 'pw'
      }
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('bareos::director') }
    it { is_expected.to contain_file(filename).with_content(%r{^Console \{$}) }
    it { is_expected.to contain_file(filename).with_content(%r{Name = "name"$}) }
    it { is_expected.to contain_file(filename).with_tag(['bareos', 'bareos_director']) }
  end

  context 'with all params set' do
    res = BareosResourceHelper.new('Console')
    res.param('name', 'Name', 'name').
      param('description', 'Description', 'string').
      param('catalog_acl', 'Catalog ACL', 'acl').
      param('client_acl', 'Client ACL', 'acl').
      param('command_acl', 'Command ACL', 'acl').
      param('file_set_acl', 'File Set ACL', 'acl').
      param('job_acl', 'Job ACL', 'acl').
      param('password', 'Password', 'autopassword').
      param('plugin_options_acl', 'Plugin Options ACL', 'acl').
      param('pool_acl', 'Pool ACL', 'acl').
      param('profile', 'Profile', 'resource_list').
      param('run_acl', 'Run ACL', 'acl').
      param('schedule_acl', 'Schedule ACL', 'acl').
      param('storage_acl', 'Storage ACL', 'acl').
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
      param('where_acl', 'Where ACL', 'acl')

    let(:params) { res.params }
    # required resources
    let(:pre_condition) do
      '
      bareos::director::profile { "name": }
      '
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file(filename).with_content(res.content) }
    it do
      is_expected.to contain_file(filename).
        that_notifies('Service[bareos-dir]').
        that_requires('Bareos::Director::Profile[name]')
    end
  end

  context 'with ensure absent' do
    let(:params) { { 'ensure' => 'absent' } }

    it { is_expected.to contain_file(filename).with_ensure('absent') }
  end
end
