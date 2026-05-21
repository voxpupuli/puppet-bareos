# frozen_string_literal: true

require 'spec_helper'

describe 'bareos::director::profile' do
  def filename
    '/etc/bareos/bareos-dir.d/profile/name.conf'
  end

  let(:title) { 'name' }

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'with default values for all parameters' do
        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_class('bareos::director')
          is_expected.to contain_file(filename)
            .with_content(%r{^Profile \{$})
            .with_content(%r{Name = "name"$})
            .with_tag(%w[bareos bareos_director])
        end
      end

      context 'with all params set' do
        def res_helper
          BareosResourceHelper
            .new('Profile')
            .param('name', 'Name', 'name')
            .param('description', 'Description', 'string')
            .param('catalog_acl', 'Catalog ACL', 'acl')
            .param('client_acl', 'Client ACL', 'acl')
            .param('command_acl', 'Command ACL', 'acl')
            .param('file_set_acl', 'File Set ACL', 'acl')
            .param('job_acl', 'Job ACL', 'acl')
            .param('plugin_options_acl', 'Plugin Options ACL', 'acl')
            .param('pool_acl', 'Pool ACL', 'acl')
            .param('schedule_acl', 'Schedule ACL', 'acl')
            .param('storage_acl', 'Storage ACL', 'acl')
            .param('where_acl', 'Where ACL', 'acl')
        end

        let(:params) { res_helper.params }
        let(:content) { res_helper.content }

        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_file(filename)
            .with_content(content)
            .that_notifies('Service[bareos-dir]')
        end
      end

      context 'with ensure absent' do
        let(:params) { { 'ensure' => 'absent' } }

        it { is_expected.to contain_file(filename).with_ensure('absent') }
      end
    end
  end
end
