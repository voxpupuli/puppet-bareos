# frozen_string_literal: true

require 'spec_helper'

describe 'bareos::director::user' do
  let :node do
    'rspec.puppet.com'
  end
  let(:title) { 'name' }

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let :facts do
        os_facts
      end

      filename = '/etc/bareos/bareos-dir.d/user/name.conf'

      context 'with required values' do
        let(:params) { {} }

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('bareos::director') }
        it { is_expected.to contain_file(filename).with_content(%r{^User \{$}) }
        it { is_expected.to contain_file(filename).with_content(%r{Name = "name"$}) }
        it { is_expected.to contain_file(filename).with_tag(%w[bareos bareos_director]) }
      end

      context 'with all params set' do
        res = BareosResourceHelper.new('User')
        res.param('name', 'Name', 'name')
           .param('description', 'Description', 'string')
           .param('catalog_acl', 'Catalog ACL', 'acl')
           .param('client_acl', 'Client ACL', 'acl')
           .param('command_acl', 'Command ACL', 'acl')
           .param('file_set_acl', 'File Set ACL', 'acl')
           .param('job_acl', 'Job ACL', 'acl')
           .param('plugin_options_acl', 'Plugin Options ACL', 'acl')
           .param('pool_acl', 'Pool ACL', 'acl')
           .param('profile', 'Profile', 'resource_list')
           .param('schedule_acl', 'Schedule ACL', 'acl')
           .param('storage_acl', 'Storage ACL', 'acl')
           .param('where_acl', 'Where ACL', 'acl')

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
          expect(subject).to contain_file(filename)
            .that_notifies('Service[bareos-dir]')
            .that_requires('Bareos::Director::Profile[name]')
        end
      end

      context 'with ensure absent' do
        let(:params) { { 'ensure' => 'absent' } }

        it { is_expected.to contain_file(filename).with_ensure('absent') }
      end
    end
  end
end
