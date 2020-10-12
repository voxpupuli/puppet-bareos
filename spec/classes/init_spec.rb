require 'spec_helper'
describe 'bareos' do
  on_supported_os.each do |os, facts|
    context "on #{os} " do
      let :facts do
        facts
      end

      context 'with default values for all parameters' do
        it { is_expected.to compile }
        it { is_expected.to contain_class('bareos') }
      end

      context 'with repo_username: "test", repo_password: "test"' do
        let(:params) do
          {
            repo_username: 'test',
            repo_password: 'test'
          }
        end

        it { is_expected.to compile }
        it do
          is_expected.to contain_bareos__repository('bareos').
            with_username('test').
            with_password('test')
        end
      end
    end
  end
end
