# frozen_string_literal: true

require 'spec_helper'

describe 'bareos::director::messages' do
  def filename
    '/etc/bareos/bareos-dir.d/messages/name.conf'
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
            .with_content(%r{^Messages \{$})
            .with_content(%r{Name = "name"$})
            .with_tag(%w[bareos bareos_director])
        end
      end

      context 'with all params set' do
        def res_helper
          BareosResourceHelper
            .new('Messages')
            .param('name', 'Name', 'name')
            .param('description', 'Description', 'string')
            .param('append', 'Append', 'messages_list')
            .param('catalog', 'Catalog', 'messages_list')
            .param('console', 'Console', 'messages_list')
            .param('director', 'Director', 'messages_list')
            .param('file', 'File', 'messages_list')
            .param('mail_command', 'Mail Command', 'string')
            .param('mail', 'Mail', 'messages_list')
            .param('mail_on_error', 'Mail On Error', 'messages_list')
            .param('mail_on_success', 'Mail On Success', 'messages_list')
            .param('operator_command', 'Operator Command', 'string')
            .param('operator', 'Operator', 'messages_list')
            .param('stderr', 'Stderr', 'messages_list')
            .param('stdout', 'Stdout', 'messages_list')
            .param('syslog', 'Syslog', 'messages_list')
            .param('timestamp_format', 'Timestamp Format', 'string')
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
