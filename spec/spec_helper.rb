require 'puppetlabs_spec_helper/module_spec_helper'
RSpec.configure do |c|
  c.default_facts = {
    operatingsystem: 'Redhat',
    operatingsystemrelease: '7'
  }
  # Coverage generation
  c.after(:suite) do
    RSpec::Puppet::Coverage.report!
  end
end
