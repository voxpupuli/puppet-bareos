# frozen_string_literal: true

require 'spec_helper'

describe 'bareos::client::messages' do
  let :node do
    'rspec.puppet.com'
  end
  let(:title) { 'name' }

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      filename = '/etc/bareos/bareos-fd.d/messages/name.conf'

      context 'with default values for all parameters' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('bareos::client') }
        it { is_expected.to contain_file(filename).with_content(%r{^Messages \{$}) }
        it { is_expected.to contain_file(filename).with_content(%r{Name = "name"$}) }
        it { is_expected.to contain_file(filename).with_tag(%w[bareos bareos_client]) }
      end

      context 'with all params set' do
        res = BareosResourceHelper.new('Messages')
        res.param('name', 'Name', 'name').
          param('description', 'Description', 'string').
          param('append', 'Append', 'messages_list').
          param('catalog', 'Catalog', 'messages_list').
          param('console', 'Console', 'messages_list').
          param('director', 'Director', 'messages_list').
          param('file', 'File', 'messages_list').
          param('mail_command', 'Mail Command', 'string').
          param('mail', 'Mail', 'messages_list').
          param('mail_on_error', 'Mail On Error', 'messages_list').
          param('mail_on_success', 'Mail On Success', 'messages_list').
          param('operator_command', 'Operator Command', 'string').
          param('operator', 'Operator', 'messages_list').
          param('stderr', 'Stderr', 'messages_list').
          param('stdout', 'Stdout', 'messages_list').
          param('syslog', 'Syslog', 'messages_list').
          param('timestamp_format', 'Timestamp Format', 'string')

        let(:params) { res.params }

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_file(filename).with_content(res.content) }

        it do
          expect(subject).to contain_file(filename).
            that_notifies('Service[bareos-fd]')
        end
      end

      context 'with ensure absent' do
        let(:params) { { 'ensure' => 'absent' } }

        it { is_expected.to contain_file(filename).with_ensure('absent') }
      end
    end
  end
end
