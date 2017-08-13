require 'spec_helper'
describe 'bareos::director' do
  let(:pre_condition) { 'class {"::bareos::director::director": password => "password" }' }

  context 'with default values for all parameters' do
    it { is_expected.to compile }
    it { is_expected.to contain_class('bareos') }
  end
end
