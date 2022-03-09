# frozen_string_literal: true

shared_examples 'client' do |_params, _facts|
  it {
    is_expected.to contain_class('bareos::client')
  }

  it {
    is_expected.to contain_class('bareos::client::config').that_notifies('Class[bareos::client::service]')
    is_expected.to contain_class('bareos::client::package').that_comes_before('Class[bareos::client::config]').that_notifies('Class[bareos::client::service]')
    is_expected.to contain_class('bareos::client::service')
  }

  include_examples 'client::config', _params, _facts
  include_examples 'client::package', _params, _facts
  include_examples 'client::service', _params, _facts
end
