require 'spec_helper'

describe 'bareos::director::schedule' do
  let(:title) { 'name' }

  filename = '/etc/bareos/bareos-dir.d/schedule/name.conf'

  context 'with default values for all parameters' do
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('bareos::director') }
    it { is_expected.to contain_file(filename).with_content(%r{^Schedule \{$}) }
    it { is_expected.to contain_file(filename).with_content(%r{Name = "name"$}) }
    it { is_expected.to contain_file(filename).with_tag(['bareos', 'bareos_director']) }
  end

  context 'with all params set' do
    res = BareosResourceHelper.new('Schedule')
    res.param('name', 'Name', 'name').
      param('description', 'Description', 'string').
      param('enabled', 'Enabled', 'boolean').
      param('run', 'Run', 'schedule_run_command_list')

    let(:params) { res.params }

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file(filename).with_content(res.content) }
    it do
      is_expected.to contain_file(filename).
        that_notifies('Service[bareos-dir]')
    end
  end

  context 'with ensure absent' do
    let(:params) { { 'ensure' => 'absent' } }

    it { is_expected.to contain_file(filename).with_ensure('absent') }
  end
end
