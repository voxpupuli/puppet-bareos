# @summary
#   Manages the bareos repository. Parameters should be configured in the bareos class. This class will be automatically included when a resource is defined. This class will be automatically included when a resource is defined. It is not intended to be used directly by external resources like node definitions or other modules.
#
# @param release
#   The major bareos release version which should be used
# @param subscription
#   Activate the (paid) subscription repo. Otherwise the opensource repos will be selected
# @param username
#   The major bareos release version which should be used
# @param password
#   The major bareos release version which should be used
# @param https
#   Whether https should be used in repo URL
# @param apt_key_content
#   Required content for the keyring as it cannot be downloaded here
# @param apt_key_content
#   Required source for the keyring as it cannot be downloaded here
#
class bareos::repository (
  Enum['19.2', '20', '21', '22', '23', '24', '25'] $release = '25',
  Boolean                              $subscription        = false,
  Optional[String]                     $username            = undef,
  Optional[String]                     $password            = undef,
  Boolean                              $https               = true,
  Optional[String]                     $apt_key_content     = undef,
  Optional[String]                     $apt_key_source      = undef,
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
    if $facts['os']['family'] == 'Debian' and empty($apt_key_content) and empty($apt_key_source) {
      fail('For Bareos subscription on Debian based systems, you need to specify the keyring content or source.')
    }
    # note the .com
    $dl_hostname = 'download.bareos.com'
    $address = "${dl_hostname}/bareos/release/${release}/"
  } else {
    $address = 'download.bareos.org/current/'
  }

  $os = $facts['os']['name']
  $osrelease = $facts['os']['release']['full']
  $osmajrelease = $facts['os']['release']['major']

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
      $url = "${scheme}${address}"
      if $subscription {
        apt::auth { $dl_hostname:
          login    => $username,
          password => $password,
        }
      }
      if $os  == 'Ubuntu' {
        $location = "${url}xUbuntu_${osrelease}"
      } else {
        $location = "${url}Debian_${osmajrelease}"
      }

      include apt
      $key_ring_fn = 'bareos-keyring.gpg'
      if $subscription {
        $apt_keyring_args = {
          source  => $apt_key_source,
          content => $apt_key_content,
        }
      } else {
        $apt_keyring_args = {
          source => "${location}/Release.key",
        }
      }
      apt::keyring { $key_ring_fn:
        * => $apt_keyring_args,
      }
      apt::source { 'bareos':
        location      => [$location],
        release       => ['/'],
        keyring       => "/etc/apt/keyrings/${key_ring_fn}",
        source_format => 'sources',
        require       => Apt::Keyring[$key_ring_fn],
      }
      Apt::Source['bareos'] -> Package <| provider == 'apt' |>
    }
    'windows': {}
    default: {
      fail('Operatingsystem is not supported by this module')
    }
  }
}
