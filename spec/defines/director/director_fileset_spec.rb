require 'spec_helper'

describe 'bareos::director::fileset' do
  let(:title) { 'name' }

  filename = '/etc/bareos/bareos-dir.d/fileset/name.conf'

  context 'with default values for all parameters' do
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('bareos::director') }
    it { is_expected.to contain_file(filename).with_content(%r{^FileSet \{$}) }
    it { is_expected.to contain_file(filename).with_content(%r{Name = "name"$}) }
    it { is_expected.to contain_file(filename).with_tag(['bareos', 'bareos_director']) }
  end

  context 'with all params set' do
    res = BareosResourceHelper.new('FileSet')
    res.param('name', 'Name', 'name').
      param('description', 'Description', 'string').
      param('enable_vss', 'Enable VSS', 'boolean').
      param('exclude', 'Exclude', 'include_exclude_item').
      param('ignore_file_set_changes', 'Ignore File Set Changes', 'boolean').
      param('include', 'Include', 'include_exclude_item')

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
