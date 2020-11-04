require 'spec_helper'
describe 'bareos::repository' do
  on_supported_os.each do |os, facts|
    context "on #{os} " do
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
            is_expected.to contain_yumrepo('bareos').
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
              is_expected.to contain_apt__source('bareos').
                with_location('http://test:test@download.bareos.com/bareos/release/latest/xUbuntu_20.04')
            end
          end
        end
      end
    end
  end
end
