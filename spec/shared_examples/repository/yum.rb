# frozen_string_literal: trued
shared_examples 'repository::yum' do |_params, _facts, _address|
  address = _address

  location = case _facts[:os]['name']
             when 'RedHat', 'VirtuozzoLinux'
               "#{address}/RHEL_#{_facts[:os]['release']['major']}"
             when 'CentOS', 'Rocky', 'AlmaLinux'
               if _params['repository_release'] == '21'
                 "#{address}/EL_#{_facts[:os]['release']['major']}"
               else
                 "#{address}/CentOS_#{_facts[:os]['release']['major']}"
               end
             when 'Fedora'
               "#{address}/Fedora_#{_facts[:os]['release']['major']}"
             when 'Amazon'
               case _facts[:os]['release']['major']
               when '2'
                 "#{address}/RHEL_7"
               end
             end

  yum_username = case _params['repository_username']
                 when :undef
                   'absent'
                 else
                   _params['repository_username']
                 end

  yum_password = case _params['repository_password']
                 when :undef
                  'absent'
                 else
                   _params['repository_password']
                 end

  it {
    is_expected.to contain_class('bareos::repository::yum')
  }

  it {
    is_expected.to contain_yumrepo('bareos').with(
      {
        'descr'    => 'Bareos Repository',
        'username' => yum_username,
        'password' => yum_password,
        'baseurl'  => location,
        'gpgcheck' => '1',
        'gpgkey'   => "#{location}/repodata/repomd.xml.key",
        'priority' => '1',
      }
    )
  }
end
