# frozen_string_literal: true

require 'spec_helper'

describe 'bareos::client' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'with default values for all parameters' do
        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_class('bareos')
        end
      end

      it 'installs the python plugin package' do
        plugin = (os_facts[:os]['family'] == 'Debian') ? 'python3-plugin' : 'python-plugin'
        is_expected.to contain_package("bareos-filedaemon-#{plugin}")
      end
    end
  end
end
