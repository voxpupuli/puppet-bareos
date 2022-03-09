# frozen_string_literal: true

shared_examples 'console' do |_params, _facts|
  it {
    is_expected.to contain_class('bareos::console')
  }

  if _params['manage_console_package']
    _params['console_packages'].each do |console_package|
      it {
        is_expected.to contain_package(console_package).with(
          'ensure' => _params['console_package_ensure'],
          'tag'    => [ 'bareos', 'bareos_console', ]
        )
      }
    end
  end

  config_console_directories = [
    "#{_params['config_directory']}/bconsole.d",
    "#{_params['config_directory']}/bconsole.d/console",
    "#{_params['config_directory']}/bconsole.d/director",
  ]

  config_console_directories.each do |config_console_directory|
    it {
      is_expected.to contain_file(config_console_directory).with(
        'ensure'  => 'directory',
        'purge'   => true,
        'recurse' => true,
        'force'   => true,
        'mode'    => _params['config_directory_mode'],
        'owner'   => _params['config_owner'],
        'group'   => _params['config_group'],
        'tag'     => [ 'bareos', 'bareos_console', ],
      )
    }
  end
end
