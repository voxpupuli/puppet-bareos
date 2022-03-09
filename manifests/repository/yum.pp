# @summary
#   manage yum repository for different OSes
#
# @api private
#
class bareos::repository::yum (
) {
  assert_private()

  $address = $bareos::repository::address

  case $facts['os']['name'] {
    'RedHat', 'VirtuozzoLinux': {
      $location = "${address}/RHEL_${facts['os']['release']['major']}"
    }
    'CentOS', 'Rocky', 'AlmaLinux': {
      if $bareos::repository_release == '21' {
        $location = "${address}/EL_${facts['os']['release']['major']}"
      } else {
        $location = "${address}/CentOS_${facts['os']['release']['major']}"
      }
    }
    'Fedora': {
      $location = "${address}/Fedora_${facts['os']['release']['major']}"
    }
    'Amazon': {
      case $facts['os']['release']['major'] {
        '2': {
          $location = "${address}/RHEL_7"
        }
      }
    }
  }

  $yum_username = $bareos::repository_username ? {
    undef   => 'absent',
    default => $bareos::repository_username,
  }

  $yum_password = $bareos::repository_password ? {
    undef   => 'absent',
    default => $bareos::repository_password,
  }

  yumrepo { 'bareos':
    descr    => 'Bareos Repository',
    username => $yum_username,
    password => $yum_password,
    baseurl  => $location,
    gpgcheck => '1',
    gpgkey   => "${location}/repodata/repomd.xml.key",
    priority => '1',
  }
}
