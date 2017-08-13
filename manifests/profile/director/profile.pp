# == Class: bareos::profile::director::profile
#
class bareos::profile::director::profile {
  bareos::director::profile {'operator':
    description        => 'Profile allowing normal Bareos operations.',
    command_acl        => [
      '!.bvfs_clear_cache, !.exit, !.sql',
      '!configure, !create, !delete, !purge, !sqlquery, !umount, !unmount',
      '*all*',
    ],
    catalog_acl        => '*all*',
    client_acl         => '*all*',
    file_set_acl       => '*all*',
    job_acl            => '*all*',
    plugin_options_acl => '*all*',
    pool_acl           => '*all*',
    schedule_acl       => '*all*',
    storage_acl        => '*all*',
    where_acl          => '*all*',
  }

  # this may be changed, so use sperate profile for webui
  ::bareos::director::profile {'webui-admin':
    description        => 'bareos-webui webui-admin profile resource.',
    command_acl        => [
      '!.bvfs_clear_cache, !.exit, !.sql',
      '!configure, !create, !delete, !purge, !sqlquery, !umount, !unmount',
      '*all*',
    ],
    catalog_acl        => '*all*',
    client_acl         => '*all*',
    file_set_acl       => '*all*',
    job_acl            => '*all*',
    plugin_options_acl => '*all*',
    pool_acl           => '*all*',
    schedule_acl       => '*all*',
    storage_acl        => '*all*',
    where_acl          => '*all*',
  }
}
