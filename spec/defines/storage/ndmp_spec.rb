# frozen_string_literal: true

require 'spec_helper'

describe 'bareos::storage::ndmp' do
  def filename
    '/etc/bareos/bareos-sd.d/ndmp/name.conf'
  end

  let(:title) { 'name' }

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'with default values for all parameters will fail' do
        it { is_expected.to compile.and_raise_error(%r{.*}) }
      end

      context 'with required values' do
        let(:params) do
          {
            'username' => 'user',
            'password' => 'pw',
          }
        end

        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_class('bareos::storage')
          is_expected.to contain_file(filename)
            .with_content(%r{^Ndmp \{$})
            .with_content(%r{Name = "name"$})
            .with_tag(%w[bareos bareos_storage])
        end
      end

      context 'with all params set' do
        def res_helper
          BareosResourceHelper
            .new('Ndmp')
            .param('name', 'Name', 'name')
            .param('description', 'Description', 'string')
            .param('auth_type', 'Auth Type', 'auth_type')
            .param('log_level', 'Log Level', 'pint32')
            .param('password', 'Password', 'autopassword')
            .param('username', 'Username', 'string')
        end

        let(:params) { res_helper.params }
        let(:content) { res_helper.content }

        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_file(filename)
            .with_content(content)
            .that_notifies('Service[bareos-sd]')
        end
      end

      context 'with ensure absent' do
        let(:params) { { 'ensure' => 'absent' } }

        it { is_expected.to contain_file(filename).with_ensure('absent') }
      end
    end
  end
end
