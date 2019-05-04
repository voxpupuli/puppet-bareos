require 'spec_helper'

describe 'bareos::monitor::monitor' do
  let(:title) { 'name' }

  filename = '/etc/bareos/tray-monitor.d/monitor/name.conf'

  context 'with default values for all parameters will fail' do
    it { is_expected.to compile.and_raise_error(%r{.*}) }
  end

  context 'with required values' do
    let(:params) do
      {
        'password' => 'password'
      }
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('bareos::monitor') }
    it { is_expected.to contain_file(filename).with_content(%r{^Monitor \{$}) }
    it { is_expected.to contain_file(filename).with_content(%r{Name = "name"$}) }
    it { is_expected.to contain_file(filename).with_tag(['bareos', 'bareos_monitor']) }
  end

  context 'with all params set' do
    res = BareosResourceHelper.new('Monitor')
    res.param('name', 'Name', 'name').
      param('description', 'Description', 'string').
      param('dir_connect_timeout', 'Dir Connect Timeout', 'time').
      param('fd_connect_timeout', 'Fd Connect Timeout', 'time').
      param('password', 'Password', 'md5password').
      param('refresh_interval', 'Refresh Interval', 'time').
      param('require_ssl', 'Require Ssl', 'boolean').
      param('sd_connect_timeout', 'Sd Connect Timeout', 'time')

    let(:params) { res.params }

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file(filename).with_content(res.content) }
  end

  context 'with ensure absent' do
    let(:params) { { 'ensure' => 'absent' } }

    it { is_expected.to contain_file(filename).with_ensure('absent') }
  end
end
