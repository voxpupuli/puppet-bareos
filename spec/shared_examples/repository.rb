# frozen_string_literal: true

shared_examples 'repository' do |_params, _facts|
  schema = if _params['repository_ssl']
             'https'
           else
             'http'
           end

  if _params['repository_subscription']
    if ! _params['repository_username'] or ! _params['repository_password']
      it {
        is_expected.to compile.and_raise_error(%r{You require a username (bareos::repository_username) and password (bareos::repository_password) for Bareos subscription repos.})
      }
    end

    host = if _params['repository_host'] != :undef
             _params['repository_host']
           else
             'download.bareos.com'
           end
  else
    host = if _params['repository_host'] != :undef
             _params['repository_host']
           else
             'download.bareos.org'
           end
  end

  address = "#{schema}://#{host}/bareos/release/#{_params['repository_release']}"

  key_id = case _params['repository_release']
           when '18.2', '19.2'
             if _params['repository_subscription']
               '641A1497F1B11BEA945F840FE5D882B28657AE28'
             else
               'A0CFE15F71F798574AB363DD118283D9A7862CEE'
             end
           when '20'
             'C68B001F74D2F20243D0B7A20CCBA537DBE083A6'
           when '21'
             '91DA1DC3564AE20A76C4CA88E01957D6C9FED482'
           end

  it {
    is_expected.to contain_class('bareos::repository')
  }

  case _facts[:os]['family']
  when 'Debian'
    include_examples 'repository::apt', _params, _facts, address, key_id
  when 'RedHat'
    include_examples 'repository::yum', _params, _facts, address
  end
end
