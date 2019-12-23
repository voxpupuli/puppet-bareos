require 'spec_helper'
describe 'bareos::director' do
  #let(:pre_condition) { 'class {"::bareos::director::director": password => "password" }' }

  context 'with default values for all parameters' do
    it { is_expected.to compile }
    it { is_expected.to contain_class('bareos') }
  end
  context 'with catalogs => { test: { db_driver: "sqlite", db_name: "test" }}}' do
    let(:params) do
      {
        catalogs: {
          test: {
            db_driver: "sqlite",
            db_name: "test",
          }
        }
      }
    end

    it { is_expected.to compile }
    it do
      is_expected.to contain_bareos__director__catalog('test')
        .with_db_driver('sqlite')
        .with_db_name('test')
    end
  end
end
