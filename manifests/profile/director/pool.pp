# == Class: bareos::profile::director::pool
# Some default pools
class bareos::profile::director::pool {
  ::bareos::director::pool { 'Differential':
    pool_type            => 'Backup',
    recycle              => true,
    auto_prune           => true,
    volume_retention     => '90 days',
    maximum_volume_bytes => '10G',
    maximum_volumes      => 100,
    label_format         => 'Differential-',
  }

  ::bareos::director::pool { 'Full':
    pool_type            => 'Backup',
    recycle              => true,
    auto_prune           => true,
    volume_retention     => '365 days',
    maximum_volume_bytes => '50G',
    maximum_volumes      => 100,
    label_format         => 'Full-',
  }

  ::bareos::director::pool { 'Incremental':
    pool_type            => 'Backup',
    recycle              => true,
    auto_prune           => true,
    volume_retention     => '30 days',
    maximum_volume_bytes => '1G',
    maximum_volumes      => 100,
    label_format         => 'Incremental-',
  }

  ::bareos::director::pool { 'Scratch':
    pool_type => 'Scratch',
  }
}
