# frozen_string_literal: true

require 'spec_helper'

describe 'bareos::director::counter' do
  def filename
    '/etc/bareos/bareos-dir.d/counter/name.conf'
  end

  let(:title) { 'name' }

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'with default values for all parameters' do
        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_class('bareos::director')
          is_expected.to contain_file(filename)
            .with_content(%r{^Counter \{$})
            .with_content(%r{Name = "name"$})
            .with_tag(%w[bareos bareos_director])
        end
      end

      context 'with all params set' do
        def res_helper
          BareosResourceHelper
            .new('Counter')
            .param('name', 'Name', 'name')
            .param('description', 'Description', 'string')
            .param('catalog', 'Catalog', 'res')
            .param('maximum', 'Maximum', 'pint32')
            .param('minimum', 'Minimum', 'int32')
            .param('wrap_counter', 'Wrap Counter', 'res')
        end

        let(:params) { res_helper.params }
        let(:content) { res_helper.content }
        # required resources
        let(:pre_condition) { <<~PUPPETCODE }
          bareos::director::catalog { "name":
            db_driver => "postgresql",
            db_name   => "test",
          }
        PUPPETCODE

        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_file(filename)
            .with_content(content)
            .that_notifies('Service[bareos-dir]')
            .that_requires('Bareos::Director::Catalog[name]')
        end
      end

      context 'with ensure absent' do
        let(:params) { { 'ensure' => 'absent' } }

        it { is_expected.to contain_file(filename).with_ensure('absent') }
      end
    end
  end
end
