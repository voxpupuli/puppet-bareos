# frozen_string_literal: true

require 'spec_helper'

describe 'bareos::director::counter' do
  let :node do
    'rspec.puppet.com'
  end
  let(:title) { 'name' }

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      filename = '/etc/bareos/bareos-dir.d/counter/name.conf'

      context 'with default values for all parameters' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('bareos::director') }
        it { is_expected.to contain_file(filename).with_content(%r{^Counter \{$}) }
        it { is_expected.to contain_file(filename).with_content(%r{Name = "name"$}) }
        it { is_expected.to contain_file(filename).with_tag(%w[bareos bareos_director]) }
      end

      context 'with all params set' do
        res = BareosResourceHelper.new('Counter')
        res.param('name', 'Name', 'name').
          param('description', 'Description', 'string').
          param('catalog', 'Catalog', 'res').
          param('maximum', 'Maximum', 'pint32').
          param('minimum', 'Minimum', 'int32').
          param('wrap_counter', 'Wrap Counter', 'res')

        let(:params) { res.params }
        # required resources
        let(:pre_condition) do
          '
          bareos::director::catalog { "name":
            db_driver => "postgresql",
            db_name   => "test",
          }
          '
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_file(filename).with_content(res.content) }

        it do
          expect(subject).to contain_file(filename).
            that_notifies('Service[bareos-dir]').
            that_requires('Bareos::Director::Catalog[name]')
        end
      end

      context 'with ensure absent' do
        let(:params) { { 'ensure' => 'absent' } }

        it { is_expected.to contain_file(filename).with_ensure('absent') }
      end
    end
  end
end
