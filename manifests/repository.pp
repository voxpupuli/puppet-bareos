# @summary
#   Manages the bareos repository. Parameters should be configured in the bareos class. This class will be automatically included when a resource is defined. This class will be automatically included when a resource is defined. It is not intended to be used directly by external resources like node definitions or other modules.
#
# @param release
#   The major bareos release version which should be used
# @param gpg_key_fingerprint
#   The GPG fingerprint of the repos key
# @param subscription
#   Activate the (paid) subscription repo. Otherwise the opensource repos will be selected
# @param username
#   The major bareos release version which should be used
# @param password
#   The major bareos release version which should be used
# @param https
#   Whether https should be used in repo URL
#
class bareos::repository (
  Enum['19.2', '20', '21', '22', '23'] $release             = '23',
  Optional[String[1]]                  $gpg_key_fingerprint = undef,
  Boolean                              $subscription        = false,
  Optional[String]                     $username            = undef,
  Optional[String]                     $password            = undef,
  Boolean                              $https               = true,
) {
  if $https {
    $scheme = 'https://'
  } else {
    $scheme = 'http://'
  }
  if $subscription {
    if empty($username) or empty($password) {
      fail('For Bareos subscription repos both username and password are required.')
    }
    # note the .com
    $address = "download.bareos.com/bareos/release/${release}/"
  } else {
    $address = "download.bareos.org/bareos/release/${release}/"
  }

  $os = $facts['os']['name']
  $osrelease = $facts['os']['release']['full']
  $osmajrelease = $facts['os']['release']['major']

  if $gpg_key_fingerprint {
    $_gpg_key_fingerprint = $gpg_key_fingerprint
  } elsif versioncmp($release, '23') >= 0 {
    # >= bareos 23
    $_gpg_key_fingerprint = '5DBE EDB2 E9D0 D238 8684  5C43 D525 2EF6 F51B CCF1'
  } elsif versioncmp($release, '22') >= 0 {
    # >= bareos 22
    $_gpg_key_fingerprint = '5D44 2966 81A7 3289 DBEE  58E4 59E9 68A5 59FE 211E'
  } elsif versioncmp($release, '21') >= 0 {
    # >= bareos 21
    $_gpg_key_fingerprint = '91DA 1DC3 564A E20A 76C4  CA88 E019 57D6 C9FE D482'
  } elsif versioncmp($release, '20') >= 0 {
    # >= bareos 20
    $_gpg_key_fingerprint = 'C68B 001F 74D2 F202 43D0 B7A2 0CCB A537 DBE0 83A6'
  } else {
    # >= bareos-18.2
    if $subscription {
      $_gpg_key_fingerprint = '641A 1497 F1B1 1BEA 945F 840F E5D8 82B2 8657 AE28'
    } else {
      $_gpg_key_fingerprint = 'A0CF E15F 71F7 9857 4AB3 63DD 1182 83D9 A786 2CEE'
    }
  }

  $yum_username = $username ? {
    undef   => 'absent',
    default => $username,
  }
  $yum_password = $password ? {
    undef   => 'absent',
    default => $password,
  }

  case $os {
    /(?i:redhat|centos|rocky|almalinux|fedora|virtuozzolinux|amazon)/: {
      $url = "${scheme}${address}"
      case $os {
        'RedHat', 'VirtuozzoLinux': {
          $location = "${url}RHEL_${osmajrelease}"
        }
        'Centos', 'Rocky', 'AlmaLinux': {
          if versioncmp($release, '21') >= 0 and versioncmp($osmajrelease, '8') >= 0 {
            $location = "${url}EL_${osmajrelease}"
          } else {
            $location = "${url}CentOS_${osmajrelease}"
          }
        }
        'Fedora': {
          $location = "${url}Fedora_${osmajrelease}"
        }
        'Amazon': {
          case $osmajrelease {
            '2': {
              $location = "${url}RHEL_7"
            }
            default: {
              fail('Operatingsystem is not supported by this module')
            }
          }
        }
        default: {
          fail('Operatingsystem is not supported by this module')
        }
      }
      yumrepo { 'bareos':
        name     => 'bareos',
        descr    => 'Bareos Repository',
        username => $yum_username,
        password => $yum_password,
        baseurl  => $location,
        gpgcheck => '1',
        gpgkey   => "${location}/repodata/repomd.xml.key",
        priority => '1',
      }
    }
    /(?i:debian|ubuntu)/: {
      if $subscription {
        $url = "${scheme}${username}:${password}@${address}"
      } else {
        $url = "${scheme}${address}"
      }
      if $os  == 'Ubuntu' {
        $location = "${url}xUbuntu_${osrelease}"
      } else {
        if $osmajrelease == '10' {
          $location = "${url}Debian_${osmajrelease}"
        } else {
          $location = "${url}Debian_${osmajrelease}.0"
        }
      }
      if $subscription {
        # release key file is not avaiable without login and
        # apt-key cannot handle username and password in URI
        $key = {
          id => regsubst($_gpg_key_fingerprint, ' ', '', 'G'),
        }
      } else {
        $key = {
          id     => regsubst($_gpg_key_fingerprint, ' ', '', 'G'),
          source => "${location}/Release.key",
        }
      }

      include apt
      ::apt::source { 'bareos':
        location => $location,
        release  => '/',
        repos    => '',
        key      => $key,
      }
      Apt::Source['bareos'] -> Package <| provider == 'apt' |>
      Class['Apt::Update']  -> Package <| provider == 'apt' |>
    }
    'windows': {}
    default: {
      fail('Operatingsystem is not supported by this module')
    }
  }
}
