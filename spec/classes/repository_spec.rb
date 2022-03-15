# frozen_string_literal: true

require 'spec_helper'
describe 'bareos::repository' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      context 'with default values for all parameters' do
        if (facts[:osfamily] == 'Debian') && (facts[:operatingsystemmajrelease] == '11')
          it 'fails' do
            expect { is_expected.to contain_class('bareos::repository') }.
              to raise_error(Puppet::PreformattedError, %r{is not distributed for})
          end
        else
          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('bareos::repository') }
        end
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
              with_password('test')
          end
        end
      when 'Debian'
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
                with_location('http://test:test@download.bareos.com/bareos/release/latest/xUbuntu_20.04')
            end
          end
        end
      end
    end
  end
end
