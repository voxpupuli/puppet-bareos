# frozen_string_literal: trued
shared_examples 'repository::apt' do |_params, _facts, _address, _key_id|
  it {
    is_expected.to contain_class('apt')
  }

  address = _address
  key_id = _key_id

  if _params['repository_subscription']
    it {
      is_expected.to contain_file('/etc/apt/auth.conf.d/bareos').with(
        {
          'ensure' => 'present',
          'owner' => 'root',
          'group' => 'root',
          'mode' => '0600',
        }
      ).that_notifies('Class[apt::update]')
    }
  else
    it {
      is_expected.to contain_file('/etc/apt/auth.conf.d/bareos').with(
        {
          'ensure' => 'absent',
        }
      ).that_notifies('Class[apt::update]')
    }
  end

  location = case _facts[:os]['name']
             when 'Debian'
               case _facts[:os]['release']['major']
               when '10'
                 "#{address}/Debian_#{_facts[:os]['release']['major']}"
               else
                 "#{address}/Debian_#{_facts[:os]['release']['major']}.0"
               end
             when 'Ubuntu'
               "#{address}/xUbuntu_#{_facts[:os]['release']['major']}.0"
             end

  key = {
    'id' => key_id,
    'source' => "#{address}/Release.key",
  }.merge(_params['repository_key'])

  it {
    is_expected.to contain_class('bareos::repository::apt')
  }

  it {
    is_expected.to contain_apt__source('bareos').with(
      'location' => "#{location}",
      'release'  => '/',
      'repos'    => '',
      'key'      => key,
    ).that_notifies('Class[apt::update]')
  }
end
