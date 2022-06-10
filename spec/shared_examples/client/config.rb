# frozen_string_literal: true

shared_examples 'client::config' do |_params, _facts|
  it {
    is_expected.to contain_class('bareos::client::config')
  }

  client_config_directory = "#{_params['config_directory']}/#{_params['client_config_directory']}"

  if _params['enable_client']
    it {
      is_expected.to contain_file(client_config_directory).with(
        {
          'ensure'  => 'directory',
          'force'   => true,
          'group'   => _params['config_group'],
          'mode'    => _params['config_directory_mode'],
          'owner'   => _params['config_owner'],
          'purge'   => true,
          'recurse' => true,
        }
      )
    }

    [
      "#{client_config_directory}/client",
      "#{client_config_directory}/director",
      "#{client_config_directory}/messages",
    ].each do |client_directory|
      it {
        is_expected.to contain_file(client_directory).with(
          {
            'ensure' => 'directory',
            'group'  => _params['config_group'],
            'mode'   => _params['config_directory_mode'],
            'owner'  => _params['config_owner'],
          }
        )
      }
    end
  else
    it {
      is_expected.to contain_file(client_config_directory).with(
        {
          'ensure'  => 'absent',
          'force'   => true,
          'purge'   => true,
          'recurse' => true,
        }
      )
    }
  end


end
