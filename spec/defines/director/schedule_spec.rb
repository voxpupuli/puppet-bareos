# frozen_string_literal: true

require 'spec_helper'

describe 'bareos::director::schedule' do
  def filename
    '/etc/bareos/bareos-dir.d/schedule/name.conf'
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
            .with_content(%r{^Schedule \{$})
            .with_content(%r{Name = "name"$})
            .with_tag(%w[bareos bareos_director])
        end
      end

      context 'with all params set' do
        def res_helper
          BareosResourceHelper
            .new('Schedule')
            .param('name', 'Name', 'name')
            .param('description', 'Description', 'string')
            .param('enabled', 'Enabled', 'boolean')
            .param('run', 'Run', 'schedule_run_command_list')
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
