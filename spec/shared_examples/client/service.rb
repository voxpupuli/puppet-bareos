# frozen_string_literal: true

shared_examples 'client::service' do |_params, _facts|
  it {
    is_expected.to contain_class('bareos::client::service')
  }

  if _params['enable_client'] && _params['manage_client_service']
    it {
      is_expected.to contain_service(_params['client_service']).with(
        {
          'ensure' => _params['client_service_ensure'],
          'enable' => _params['client_service_enable'],
        }
      )
    }
  else
    it {
      is_expected.not_to contain_service(_params['client_service'])
    }
  end
end
