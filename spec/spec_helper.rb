require 'puppetlabs_spec_helper/module_spec_helper'
require_relative './settings_helper.rb'

RSpec.configure do |c|
  c.default_facts = {
    operatingsystem: 'RedHat',
    osfamily: 'RedHat',
    operatingsystemmajrelease: '7',
    operatingsystemrelease: '7.0',
    puppetversion: Puppet.version,
    :os => {
      'name' => 'RedHat',
      'release' => {
        'full' => '7.0',
        'major' => '7'
      },
    }
  }
  # Coverage generation
  c.after(:suite) do
    RSpec::Puppet::Coverage.report!
  end
end
