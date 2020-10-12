require 'spec_helper'
describe 'bareos::repository' do
  on_supported_os.each do |os, facts|
    context "on #{os} " do
      let :facts do
        facts
      end

      context 'with default values for all parameters' do
        it { is_expected.to compile }
        it { is_expected.to contain_class('bareos::repository') }
      end

      context 'with username: "test", password: "test"' do
        let(:params) do
          {
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
    end
  end
end
