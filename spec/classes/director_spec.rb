require 'spec_helper'

describe 'bareos::director' do
  on_supported_os.each do |os, facts|
    context "on #{os} " do
      let :facts do
        facts
      end

      context 'with default values for all parameters' do
        it { is_expected.to compile }
        it { is_expected.to contain_class('bareos') }
      end

      context 'with catalogs => { test: { db_driver: "sqlite", db_name: "test" }}}' do
        let(:params) do
          {
            catalogs: {
              test: {
                db_driver: 'sqlite',
                db_name: 'test'
              }
            }
          }
        end

        it { is_expected.to compile }
        it do
          is_expected.to contain_bareos__director__catalog('test').
            with_db_driver('sqlite').
            with_db_name('test')
        end
      end

    end
  end
  context "on ubuntu-18.04-x86_64" do
    let(:facts) do
      {'service_provider' => 'systemd',}.merge(on_supported_os['ubuntu-18.04-x86_64'])
    end
  
    it { is_expected.to compile.with_all_deps }
    it do
      is_expected.to contain_service('bareos-dir').with('has_restart' => false, 'restart' => 'systemctl bareos-dir reload')
    end
  end
end
