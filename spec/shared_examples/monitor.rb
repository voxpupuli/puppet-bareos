# frozen_string_literal: true

shared_examples 'monitor' do |_params, _facts|
  it {
    is_expected.to contain_class('bareos::monitor')
  }

  if _params['manage_monitor_package']
    _params['monitor_packages'].each do |monitor_package|
      it {
        is_expected.to contain_package(monitor_package).with(
          'ensure' => _params['monitor_package_ensure'],
          'tag'    => [ 'bareos', 'bareos_monitor', ]
        )
      }
    end
  end

  config_monitor_directories = [
    "#{_params['config_directory']}/tray-monitor.d",
    "#{_params['config_directory']}/tray-monitor.d/client",
    "#{_params['config_directory']}/tray-monitor.d/director",
    "#{_params['config_directory']}/tray-monitor.d/monitor",
    "#{_params['config_directory']}/tray-monitor.d/storage",
  ]

  config_monitor_directories.each do |config_monitor_directory|
    it {
      is_expected.to contain_file(config_monitor_directory).with(
        'ensure'  => 'directory',
        'purge'   => true,
        'recurse' => true,
        'force'   => true,
        'mode'    => _params['config_directory_mode'],
        'owner'   => _params['config_owner'],
        'group'   => _params['config_group'],
        'tag'     => [ 'bareos', 'bareos_monitor', ],
      )
    }
  end
end
