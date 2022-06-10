# frozen_string_literal: true

shared_examples 'client::package' do |_params, _facts|
  it {
    is_expected.to contain_class('bareos::client::package')
  }

  if _params['enable_client'] && _params['manage_client_package']
    _params['client_packages'].each do |client_package|
      it {
        is_expected.to contain_package(client_package).with(
          {
            'ensure' => _params['client_package_ensure'],
          }
        )
      }
    end
  else
    _params['client_packages'].each do |client_package|
      it {
        is_expected.not_to contain_package(client_package)
      }
    end
  end
end
