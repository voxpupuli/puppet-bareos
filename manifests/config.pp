# @summary
#
# @api private
#
class bareos::config (
) {
  assert_private()

  if $bareos::manage_user {
    group { $bareos::config_group:
      ensure     => present,
      forcelocal => true,
      system     => true,
    }

    user { $bareos::config_owner:
      ensure     => present,
      comment    => 'Bareos system user',
      forcelocal => true,
      home       => '/var/lib/bareos',
      shell      => '/bin/false',
      groups     => [
        'disk',
        'tape',
        $bareos::config_group,
      ],
      system     => true,
    }
  }

  file { $bareos::config_directory:
    ensure       => directory,
    force        => true,
    group        => $bareos::config_group,
    mode         => $bareos::config_directory_mode,
    owner        => $bareos::config_owner,
    purge        => true,
    recurse      => true,
    recurselimit => 1,
  }
}
