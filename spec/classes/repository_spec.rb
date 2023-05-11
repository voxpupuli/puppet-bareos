# frozen_string_literal: true

require 'spec_helper'
describe 'bareos::repository' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      context 'with default values for all parameters' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('bareos::repository') }
      end

      case facts[:osfamily]
      when 'RedHat'
        context 'with subscription: true, username: "test", password: "test"' do
          let(:params) do
            {
              subscription: true,
              username: 'test',
              password: 'test'
            }
          end

          it { is_expected.to compile }

          it do
            expect(subject).to contain_yumrepo('bareos').
              with_username('test').
              with_password('test').
              with_baseurl(%r{^https:})
          end
        end

        context 'with https: false' do
          let(:params) do
            {
              https: false,
            }
          end

          it { is_expected.to compile }

          it do
            expect(subject).to contain_yumrepo('bareos').
              with_baseurl(%r{^http:})
          end
        end
      when 'Debian'
        context 'with https: false' do
          let(:params) do
            {
              https: false,
            }
          end

          it { is_expected.to compile }

          it do
            expect(subject).to contain_apt__source('bareos').
              with_location(%r{^http:})
          end
        end

        case facts[:operatingsystem]
        when 'Debian'
          case facts[:operatingsystemmajrelease]
          when '11'
            context 'with release: "19.2"' do
              let(:params) do
                {
                  release: '19.2'
                }
              end

              it { is_expected.to compile.and_raise_error(%r{Bareos 19.2 is not distributed for Debian 11}) }
            end
          end
        when 'Ubuntu'
          case facts[:operatingsystemmajrelease]
          when '20'
            context 'with subscription: true, username: "test", password: "test"' do
              let(:params) do
                {
                  subscription: true,
                  username: 'test',
                  password: 'test'
                }
              end

              it { is_expected.to compile }

              it do
                expect(subject).to contain_apt__source('bareos').
                  with_location('https://test:test@download.bareos.com/bareos/release/latest/xUbuntu_20.04')
              end
            end
          end
        end
      end
    end
  end
end
