source ENV['GEM_SOURCE'] || 'https://rubygems.org'
puppetversion = ENV.key?('PUPPET_GEM_VERSION') ? (ENV['PUPPET_GEM_VERSION']).to_s : ['>= 3.3']

if RUBY_VERSION >= '1.8.7' && RUBY_VERSION < '1.9'
  gem 'rake', '~> 10.0'
  gem 'rspec', '~> 2.0'
elsif RUBY_VERSION < '2.0'
  # json 2.x requires ruby 2.0. Lock to 1.8
  gem 'json', '= 1.8'
  # json_pure 2.0.2 requires ruby 2.0, and 2.0.1 requires ruby 1.9. Lock to 1.8.3.
  gem 'json_pure', '= 1.8.3'
  gem 'public_suffix', '= 1.4.6'
end

gem 'facter', '>= 1.7.0'
gem 'metadata-json-lint', RUBY_VERSION < '2.0' ? '= 0.0.19' : '>= 1.2.2'
gem 'puppet', puppetversion
gem 'puppet-lint', '>= 2.0.0'
gem 'puppetlabs_spec_helper', '>= 1.0.0'
gem 'rspec-puppet', '<=2.6.9'
gem 'rubocop', RUBY_VERSION < '2.0' ? '= 0.41.0' : '>= 0.41.0'
