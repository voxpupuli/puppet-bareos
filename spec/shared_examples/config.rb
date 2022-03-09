# frozen_string_literal: true

shared_examples 'config' do |_params, _facts|  
  it {
    is_expected.to contain_class('bareos::config')
  }

  if _params['manage_user']
    it {
      is_expected.to contain_group(_params['config_group']).with(
        {
          'ensure'     => 'present',
          'forcelocal' => true,
          'system'     => true,
        }
      ).that_comes_before("User[#{_params['config_owner']}]")
    }

    it {
      is_expected.to contain_user(_params['config_owner']).only_with(
        {
          'ensure'     => 'present',
          'forcelocal' => true,
          'comment'    => 'Bareos system user',
          'home'       => '/var/lib/bareos',
          'shell'      => '/bin/false',
          'groups'     => [
            'disk',
            'tape',
            _params['config_group'],
          ],
          'system'     => true,
        }
      )
    }
  end

  it {
    is_expected.to contain_file(_params['config_directory']).only_with(
      {
        'ensure'       => 'directory',
        'force'        => true,
        'group'        => _params['config_group'],
        'mode'         => _params['config_directory_mode'],
        'owner'        => _params['config_owner'],
        'purge'        => true,
        'recurse'      => true,
        'recurselimit' => 1,
      }
    )
  }
end
