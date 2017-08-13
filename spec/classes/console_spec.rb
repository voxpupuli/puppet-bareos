require 'spec_helper'
describe 'bareos::console' do
  context 'with default values for all parameters' do
    it { is_expected.to compile }
    it { is_expected.to contain_class('bareos') }
  end
end
