# frozen_string_literal: true

require 'spec_helper'

describe 'bareos::director' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'with default values for all parameters' do
        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_class('bareos')
        end
      end

      context 'with a catalog configured,' do
        let(:params) do
          {
            catalogs: {
              test: {
                db_driver: 'postgresql',
                db_name: 'test',
              },
            },
          }
        end

        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_bareos__director__catalog('test')
            .with_db_driver('postgresql')
            .with_db_name('test')
        end
      end
    end
  end
end
