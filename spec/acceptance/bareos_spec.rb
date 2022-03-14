# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'bareos class' do
  it_behaves_like 'the example', 'init.pp'
end
