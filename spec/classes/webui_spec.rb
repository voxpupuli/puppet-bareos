# frozen_string_literal: true

require 'spec_helper'
describe 'bareos::webui' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      context 'with default values for all parameters' do
        it { is_expected.to compile }
        it { is_expected.to contain_class('bareos') }
      end

      context 'with directors => { test: { dir_address: "example.org", catalog: "MyCatalog" }}}' do
        let(:params) do
          {
            directors: {
              test: {
                dir_address: 'example.org',
                catalog: 'MyCatalog'
              }
            }
          }
        end

        it { is_expected.to compile }

        it do
          expect(subject).to contain_bareos__webui__director('test').
            with_dir_address('example.org').
            with_catalog('MyCatalog')
        end
      end
    end
  end
end
