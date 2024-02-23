# frozen_string_literal: true

require 'spec_helper'

describe 'bareos::director' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      context 'with default values for all parameters' do
        it { is_expected.to compile }
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('bareos') }
      end

      context 'with catalogs => { test: { db_driver: "postgresql", db_name: "test" }}}' do
        let(:params) do
          {
            catalogs: {
              test: {
                db_driver: 'postgresql',
                db_name: 'test'
              }
            }
          }
        end

        it { is_expected.to compile }

        it do
          expect(subject).to contain_bareos__director__catalog('test').
            with_db_driver('postgresql').
            with_db_name('test')
        end
      end
    end
  end
end
