require 'spec_helper'

describe 'bareos::monitor::storage' do
  let(:title) { 'name' }

  filename = '/etc/bareos/tray-monitor.d/storage/name.conf'

  context 'with default values for all parameters will fail' do
    it { is_expected.to compile.and_raise_error(%r{.*}) }
  end

  context 'with required values' do
    let(:params) do
      {
        'password' => 'password',
        'address'  => 'localhost'
      }
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('bareos::monitor') }
    it { is_expected.to contain_file(filename).with_content(%r{^Storage \{$}) }
    it { is_expected.to contain_file(filename).with_content(%r{Name = "name"$}) }
    it { is_expected.to contain_file(filename).with_tag(['bareos', 'bareos_monitor']) }
  end

  context 'with all params set' do
    res = BareosResourceHelper.new('Storage')
    res.param('name', 'Name', 'name').
      param('description', 'Description', 'string').
      param('address', 'Address', 'string').
      param('enable_ssl', 'Enable Ssl', 'boolean').
      param('password', 'Password', 'md5password').
      param('sd_address', 'Sd Address', 'string').
      param('sd_password', 'Sd Password', 'md5password').
      param('sd_port', 'Sd Port', 'pint32')

    let(:params) { res.params }

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file(filename).with_content(res.content) }
  end

  context 'with ensure absent' do
    let(:params) { { 'ensure' => 'absent' } }

    it { is_expected.to contain_file(filename).with_ensure('absent') }
  end
end
