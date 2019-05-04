require 'spec_helper'

describe 'bareos::monitor::director' do
  let(:title) { 'name' }

  filename = '/etc/bareos/tray-monitor.d/director/name.conf'

  context 'with default values for all parameters will fail' do
    it { is_expected.to compile.and_raise_error(%r{.*}) }
  end

  context 'with required values' do
    let(:params) do
      {
        'address' => 'localhost'
      }
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('bareos::monitor') }
    it { is_expected.to contain_file(filename).with_content(%r{^Director \{$}) }
    it { is_expected.to contain_file(filename).with_content(%r{Name = "name"$}) }
    it { is_expected.to contain_file(filename).with_tag(['bareos', 'bareos_monitor']) }
  end

  context 'with all params set' do
    res = BareosResourceHelper.new('Director')
    res.param('name', 'Name', 'name').
      param('description', 'Description', 'string').
      param('address', 'Address', 'string').
      param('dir_port', 'Dir Port', 'pint32').
      param('enable_ssl', 'Enable Ssl', 'boolean')

    let(:params) { res.params }

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file(filename).with_content(res.content) }
  end

  context 'with ensure absent' do
    let(:params) { { 'ensure' => 'absent' } }

    it { is_expected.to contain_file(filename).with_ensure('absent') }
  end
end
