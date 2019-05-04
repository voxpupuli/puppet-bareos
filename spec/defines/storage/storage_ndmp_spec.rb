require 'spec_helper'

describe 'bareos::storage::ndmp' do
  let(:title) { 'name' }

  filename = '/etc/bareos/bareos-sd.d/ndmp/name.conf'

  context 'with default values for all parameters will fail' do
    it { is_expected.to compile.and_raise_error(%r{.*}) }
  end

  context 'with required values' do
    let(:params) do
      {
        'username' => 'user',
        'password' => 'pw'
      }
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('bareos::storage') }
    it { is_expected.to contain_file(filename).with_content(%r{^Ndmp \{$}) }
    it { is_expected.to contain_file(filename).with_content(%r{Name = "name"$}) }
    it { is_expected.to contain_file(filename).with_tag(['bareos', 'bareos_storage']) }
  end

  context 'with all params set' do
    res = BareosResourceHelper.new('Ndmp')
    res.param('name', 'Name', 'name').
      param('description', 'Description', 'string').
      param('auth_type', 'Auth Type', 'auth_type').
      param('log_level', 'Log Level', 'pint32').
      param('password', 'Password', 'autopassword').
      param('username', 'Username', 'string')

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
