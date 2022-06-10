# @summary
#   manage apt repository for different OSes
#
# @api private
#
class bareos::repository::apt (
) {
  assert_private()

  include apt

  $address = $bareos::repository::address

  if $bareos::repository_subscription {
    file { '/etc/apt/auth.conf.d/bareos':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0600',
      content => Sensitive("machine ${address} login ${bareos::repository_username} password ${bareos::repository_password}"),
      notify  => Class['apt::update'],
    }
  } else {
    file { '/etc/apt/auth.conf.d/bareos':
      ensure => 'absent',
      notify => Class['apt::update'],
    }
  }

  $location = $facts['os']['name'] ? {
    'Debian' => $facts['os']['release']['major'] ? {
      '10'    => "${address}/Debian_${facts['os']['release']['major']}",
      default => "${address}/Debian_${facts['os']['release']['major']}.0",
    },
    'Ubuntu' => "${address}/xUbuntu_${facts['os']['release']['major']}.0",
  }

  $key = {
    id     => $bareos::repository::key_id,
    source => "${address}/Release.key",
  }.merge($bareos::repository_key)

  apt::source { 'bareos':
    location => $location,
    release  => '/',
    repos    => '',
    key      => $key,
    notify   => Class['apt::update'],
  }
}
