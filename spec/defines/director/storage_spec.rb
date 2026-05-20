# frozen_string_literal: true

require 'spec_helper'

describe 'bareos::director::storage' do
  def filename
    '/etc/bareos/bareos-dir.d/storage/name.conf'
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
            'address' => '127.0.0.1',
            'device' => 'Device',
            'media_type' => 'File',
            'password' => 'pw',
          }
        end

        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_class('bareos::director')
          is_expected.to contain_file(filename)
            .with_content(%r{^Storage \{$})
            .with_content(%r{Name = "name"$})
            .with_tag(%w[bareos bareos_director])
        end
      end

      context 'with all params set' do
        def res_helper
          BareosResourceHelper
            .new('Storage')
            .param('name', 'Name', 'name')
            .param('description', 'Description', 'string')
            .param('address', 'Address', 'string')
            .param('allow_compression', 'Allow Compression', 'boolean')
            .param('auth_type', 'Auth Type', 'auth_type')
            .param('auto_changer', 'Auto Changer', 'boolean')
            .param('cache_status_interval', 'Cache Status Interval', 'time')
            .param('changer_device', 'Changer Device', 'strname')
            .param('collect_statistics', 'Collect Statistics', 'boolean')
            .param('device', 'Device', 'resource_list')
            .param('enabled', 'Enabled', 'boolean')
            .param('heartbeat_interval', 'Heartbeat Interval', 'time')
            .param('maximum_bandwidth_per_job', 'Maximum Bandwidth Per Job', 'speed')
            .param('maximum_concurrent_jobs', 'Maximum Concurrent Jobs', 'pint32')
            .param('maximum_concurrent_read_jobs', 'Maximum Concurrent Read Jobs', 'pint32')
            .param('media_type', 'Media Type', 'strname')
            .param('paired_storage', 'Paired Storage', 'res').param_val('paired_storage', 'name2', '"name2"')
            .param('password', 'Password', 'autopassword')
            .param('port', 'Port', 'pint32')
            .param('protocol', 'Protocol', 'auth_protocol_type')
            .param('tape_device', 'Tape Device', 'string_list')
            .param('tls_allowed_cn', 'Tls Allowed Cn', 'string_list')
            .param('tls_authenticate', 'Tls Authenticate', 'boolean')
            .param('tls_ca_certificate_dir', 'Tls Ca Certificate Dir', 'directory')
            .param('tls_ca_certificate_file', 'Tls Ca Certificate File', 'directory')
            .param('tls_certificate', 'Tls Certificate', 'directory')
            .param('tls_certificate_revocation_list', 'Tls Certificate Revocation List', 'directory')
            .param('tls_cipher_list', 'Tls Cipher List', 'string')
            .param('tls_dh_file', 'Tls Dh File', 'directory')
            .param('tls_enable', 'Tls Enable', 'boolean')
            .param('tls_key', 'Tls Key', 'directory')
            .param('tls_require', 'Tls Require', 'boolean')
            .param('tls_verify_peer', 'Tls Verify Peer', 'boolean')
            .param('username', 'Username', 'string')
        end

        let(:params) { res_helper.params }
        let(:content) { res_helper.content }
        # required resources
        let(:pre_condition) { <<~PUPPETCODE }
          bareos::director::storage { "name2":
            address => "127.0.0.1",
            device  => "Device",
            media_type => "File",
            password => "pw",
          }
        PUPPETCODE

        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_file(filename)
            .with_content(content)
            .that_notifies('Service[bareos-dir]')
            .that_requires('Bareos::Director::Storage[name2]')
        end
      end

      context 'with ensure absent' do
        let(:params) { { 'ensure' => 'absent' } }

        it { is_expected.to contain_file(filename).with_ensure('absent') }
      end
    end
  end
end
