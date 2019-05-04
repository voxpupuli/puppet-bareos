require 'spec_helper'

describe 'bareos::director::profile' do
  let(:title) { 'name' }

  filename = '/etc/bareos/bareos-dir.d/profile/name.conf'

  context 'with default values for all parameters' do
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('bareos::director') }
    it { is_expected.to contain_file(filename).with_content(%r{^Profile \{$}) }
    it { is_expected.to contain_file(filename).with_content(%r{Name = "name"$}) }
    it { is_expected.to contain_file(filename).with_tag(['bareos', 'bareos_director']) }
  end

  context 'with all params set' do
    res = BareosResourceHelper.new('Profile')
    res.param('name', 'Name', 'name').
      param('description', 'Description', 'string').
      param('catalog_acl', 'Catalog ACL', 'acl').
      param('client_acl', 'Client ACL', 'acl').
      param('command_acl', 'Command ACL', 'acl').
      param('file_set_acl', 'File Set ACL', 'acl').
      param('job_acl', 'Job ACL', 'acl').
      param('plugin_options_acl', 'Plugin Options ACL', 'acl').
      param('pool_acl', 'Pool ACL', 'acl').
      param('schedule_acl', 'Schedule ACL', 'acl').
      param('storage_acl', 'Storage ACL', 'acl').
      param('where_acl', 'Where ACL', 'acl')

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
