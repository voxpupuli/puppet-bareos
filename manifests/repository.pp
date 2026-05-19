# @summary
#   Manages the bareos repository. Parameters should be configured in the bareos class. This class will be automatically included when a resource is defined. This class will be automatically included when a resource is defined. It is not intended to be used directly by external resources like node definitions or other modules.
#
# @param release
#   The major bareos release version which should be used
# @param subscription
#   Activate the (paid) subscription repo. Otherwise the opensource repos will be selected
# @param username
#   The username is required for accessing subscription content
# @param password
#   The password is required for accessing subscription content
# @param apt_key_content
#   Required content (or use apt_key_source) for the keyring as it cannot be downloaded here
# @param apt_key_source
#   Required source (or use apt_key_content) for the keyring as it cannot be downloaded here
#
class bareos::repository (
  Enum['19.2', '20', '21', '22', '23', '24', '25'] $release = '25',
  Boolean                              $subscription        = false,
  Optional[String]                     $username            = undef,
  Optional[String]                     $password            = undef,
  Optional[String]                     $apt_key_content     = undef,
  Optional[String]                     $apt_key_source      = undef,
) {
  if $subscription {
    if empty($username) or empty($password) {
      fail('For Bareos subscription repos both username and password are required.')
    }
    if $facts['os']['family'] == 'Debian' and empty($apt_key_content) and empty($apt_key_source) {
      fail('For Bareos subscription on Debian based systems, you need to specify the keyring content or source.')
    }
    # note the .com
    $dl_hostname = 'download.bareos.com'
    $url = "https://${dl_hostname}/bareos/release/${release}/"
  } else {
    $url = 'https://download.bareos.org/current/'
  }

  # Amazon Linux 2 behaves like RHEL 7 and will be End-of-Life on June 30, 2026.  Support for RHEL 7
  # was dropped starting with BareOS 24.  If we encounter versions of Amazon Linux other than 2,
  # where we can't just pretend it's RHEL 7, BareOS does not explicitly offer repository support,
  # and we should fail out.
  if $facts['os']['name'] == 'Amazon'
  and (
    versioncmp($facts['os']['release']['major'], '2') != 0
    or versioncmp($release, '24') >= 0
  ) {
    fail('Operating system has no repository support!')
  }

  $os = $facts['os']['name']
  # If it's Amazon Linux 2 (which is the only version left at this point), pretend it's RHEL 7.
  $osmajrelease = $os == 'Amazon' ? {
    true    => '7',
    default => $facts['os']['release']['major'],
  }

  $yum_username = $username ? {
    undef   => 'absent',
    default => $username,
  }
  $yum_password = $password ? {
    undef   => 'absent',
    default => $password,
  }

  case $facts['os']['family'] {
    'RedHat': {
      if $subscription and versioncmp($release, '20') <= 0 {
        case $os {
          'RedHat', 'Amazon', 'VirtuozzoLinux': { $location = "${url}RHEL_${osmajrelease}" }
          'Fedora':                             { $location = "${url}Fedora_${osmajrelease}" }
          default:                              { $location = "${url}CentOS_${osmajrelease}" }
        }
      } elsif $subscription and versioncmp($release, '21') <= 0 {
        case $os {
          'Fedora': { $location = "${url}Fedora_${osmajrelease}" }
          'Amazon': { $location = "${url}RHEL_7" }
          default:  { $location = "${url}EL_${osmajrelease}" }
        }
      } else {
        case $os {
          'Fedora': { $location = "${url}Fedora_${osmajrelease}" }
          default:  { $location = "${url}EL_${osmajrelease}" }
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
    'Debian': {
      if $subscription {
        apt::auth { $dl_hostname:
          login    => $username,
          password => $password,
        }
      }
      if $os  == 'Ubuntu' {
        $location = "${url}xUbuntu_${osmajrelease}"
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
        types         => ['deb',],
        require       => Apt::Keyring[$key_ring_fn],
      }
      Apt::Source['bareos'] -> Package <| provider == 'apt' |>
      Class['Apt::Update']  -> Package <| provider == 'apt' |>
    }
    'windows': {}
    default: { fail('Operatingsystem is not supported by this module') }
  }
}
