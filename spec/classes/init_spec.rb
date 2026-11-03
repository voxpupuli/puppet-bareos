# frozen_string_literal: true

require 'spec_helper'

describe 'bareos' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'with default values for all parameters' do
        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_class('bareos')
        end

        it 'orders the packages after the repository' do
          case os_facts[:os]['family']
          when 'Debian'
            is_expected.to contain_package('bareos-common').that_requires(['Apt::Source[bareos]', 'Class[Apt::Update]'])
          when 'RedHat'
            is_expected.to contain_package('bareos-common').that_requires('Yumrepo[bareos]')
          end
        end
      end

      context 'with a subscription repository configured,' do
        let(:params) do
          {
            repo_subscription: true,
            repo_username: 'test',
            repo_password: 'test',
            repo_apt_key_content: 'test_key_content',
          }
        end

        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_class('bareos::repository')
            .with_subscription(true)
            .with_username('test')
            .with_password('test')
            .with_apt_key_content('test_key_content')
        end
      end
    end
  end
end
