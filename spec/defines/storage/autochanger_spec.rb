# frozen_string_literal: true

require 'spec_helper'

describe 'bareos::storage::autochanger' do
  def filename
    '/etc/bareos/bareos-sd.d/autochanger/name.conf'
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
            'changer_command' => '/bin/command',
            'changer_device' => '/dev/tape',
            'device' => 'name',
          }
        end
        let(:pre_condition) { <<~PUPPETCODE }
          bareos::storage::device { "name":
            archive_device => "/dev/tape",
            media_type     => "DLT7000"
          }
        PUPPETCODE

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('bareos::storage') }
        it { is_expected.to contain_file(filename).with_content(%r{^Autochanger \{$}) }
        it { is_expected.to contain_file(filename).with_content(%r{Name = "name"$}) }
        it { is_expected.to contain_file(filename).with_tag(%w[bareos bareos_storage]) }
      end

      context 'with all params set' do
        def res_helper
          BareosResourceHelper
            .new('Autochanger')
            .param('name', 'Name', 'name')
            .param('description', 'Description', 'string')
            .param('changer_command', 'Changer Command', 'strname')
            .param('changer_device', 'Changer Device', 'strname')
            .param('device', 'Device', 'resource_list')
        end

        let(:params) { res_helper.params }
        let(:content) { res_helper.content }
        # required resources
        let(:pre_condition) { <<~PUPPETCODE }
          bareos::storage::device { "name":
            archive_device => "/dev/tape",
            media_type     => "DLT7000"
          }
        PUPPETCODE

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_file(filename).with_content(content) }

        it do
          is_expected.to contain_file(filename)
            .that_notifies('Service[bareos-sd]')
            .that_requires('Bareos::Storage::Device[name]')
        end
      end

      context 'with ensure absent' do
        let(:params) { { 'ensure' => 'absent' } }

        it { is_expected.to contain_file(filename).with_ensure('absent') }
      end
    end
  end
end
