# frozen_string_literal: true

require 'spec_helper'
describe 'bareos::repository' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let :facts do
        os_facts
      end

      context 'with default values for all parameters' do
        it { is_expected.to compile.with_all_deps }
      end

      case os_facts[:os]['family']
      when 'RedHat'
        context 'with subscription unset,' do
          let(:params) { {} }

          it 'contains the community baseurl' do
            is_expected.to contain_yumrepo('bareos')
              .with_baseurl(%r{^https://download\.bareos\.org})
          end
        end

        context 'with subscription: true, username: "test", password: "test"' do
          let(:params) do
            {
              subscription: true,
              username: 'test',
              password: 'test',
            }
          end

          it { is_expected.to compile.with_all_deps }

          it 'contains the subscriber baseurl and credentials' do
            is_expected.to contain_yumrepo('bareos')
              .with_username('test')
              .with_password('test')
              .with_baseurl(%r{^https://download\.bareos\.com})
          end
        end
      when 'Debian'
        context 'with subscription unset,' do
          let(:params) { {} }

          it 'contains the community source location, but no auth config' do
            os_xname = (facts[:os]['name'] == 'Ubuntu') ? 'xUbuntu' : facts[:os]['name']
            maj_rel = facts[:os]['release']['major']

            is_expected.not_to contain_apt__auth('download.bareos.org')
            is_expected.to contain_apt__keyring('bareos-keyring.gpg')
            is_expected.to contain_apt__source('bareos')
              .with_location(["https://download.bareos.org/current/#{os_xname}_#{maj_rel}"])
          end
        end

        context 'with subscription: true, username: "test", password: "test", apt_key_content: "test"' do
          let(:params) do
            {
              subscription: true,
              username: 'test',
              password: 'test',
              apt_key_content: 'test',
            }
          end

          it { is_expected.to compile.with_all_deps }

          it 'contains the subscriber source location and credentials' do
            os_xname = (facts[:os]['name'] == 'Ubuntu') ? 'xUbuntu' : facts[:os]['name']
            maj_rel = facts[:os]['release']['major']

            is_expected.to contain_apt__auth('download.bareos.com')
            is_expected.to contain_apt__keyring('bareos-keyring.gpg')
            is_expected.to contain_apt__source('bareos')
              .with_location(["https://download.bareos.com/bareos/release/25/#{os_xname}_#{maj_rel}"])
          end
        end
      end
    end
  end
end
