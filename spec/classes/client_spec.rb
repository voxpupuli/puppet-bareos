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

        it 'purges the config dir after installing the client packages' do
          is_expected.to contain_file('/etc/bareos').that_requires('Package[bareos-filedaemon]')
        end
      end
    end
  end
end
