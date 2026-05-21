# frozen_string_literal: true

require 'spec_helper'

describe 'bareos::monitor::director' do
  def filename
    '/etc/bareos/tray-monitor.d/director/name.conf'
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
            'address' => 'localhost',
          }
        end

        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_class('bareos::monitor')
          is_expected.to contain_file(filename)
            .with_content(%r{^Director \{$})
            .with_content(%r{Name = "name"$})
            .with_tag(%w[bareos bareos_monitor])
        end
      end

      context 'with all params set' do
        def res_helper
          BareosResourceHelper
            .new('Director')
            .param('name', 'Name', 'name')
            .param('description', 'Description', 'string')
            .param('address', 'Address', 'string')
            .param('dir_port', 'Dir Port', 'pint32')
            .param('enable_ssl', 'Enable Ssl', 'boolean')
        end

        let(:params) { res_helper.params }
        let(:content) { res_helper.content }

        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_file(filename)
            .with_content(content)
        end
      end

      context 'with ensure absent' do
        let(:params) { { 'ensure' => 'absent' } }

        it { is_expected.to contain_file(filename).with_ensure('absent') }
      end
    end
  end
end
