# == Class: bareos::repository
# This class manages the bareos repository
# Parameters should be configured in the upper class `::bareos`.
#
# This class will be automatically included when a resource is defined.
# It is not intended to be used directly by external resources like node definitions or other modules.
class bareos::repository(
  $release = 'latest',
  $gpg_key_fingerprint = undef,
) {

  $url = "http://download.bareos.org/bareos/release/${release}/"

  if versioncmp($::puppetversion, '4.0.0') >= 0 {
    $os = $facts['os']['name']
    $osrelease = $facts['os']['release']['full']
    $osmajrelease = $facts['os']['release']['major']
  } else {
    $os = $::operatingsystem
    $osrelease = $::operatingsystemrelease
    $osmajrelease = $::operatingsystemmajrelease
  }

  if $gpg_key_fingerprint {
    $_gpg_key_fingerprint = $gpg_key_fingerprint
  } elsif $release == 'latest' or versioncmp($release, '18.2') >= 0 {
    # >= bareos-18.2
    $_gpg_key_fingerprint = 'A0CF E15F 71F7 9857 4AB3 63DD 1182 83D9 A786 2CEE'
  } else {
    # >= bareos-15.2
    $_gpg_key_fingerprint = '0143 857D 9CE8 C2D1 82FE 2631 F93C 028C 093B FBA2'
  }

  case $os {
      /(?i:redhat|centos|fedora|virtuozzolinux)/: {
        case $os {
          'RedHat', 'VirtuozzoLinux': {
            $location = "${url}RHEL_${osmajrelease}"
          }
          'Centos': {
            $location = "${url}CentOS_${osmajrelease}"
          }
          'Fedora': {
            $location = "${url}Fedora_${osmajrelease}"
          }
          default: {
            fail('Operatingsystem is not supported by this module')
          }
        }
        yumrepo { 'bareos':
          name     => 'bareos',
          descr    => 'Bareos Repository',
          baseurl  => $location,
          gpgcheck => '1',
          gpgkey   => "${location}/repodata/repomd.xml.key",
          priority => '1',
        }
    }
    /(?i:debian|ubuntu)/: {
      if $os  == 'Ubuntu' {
        unless $osrelease in ['12.04', '14.04', '16.04', '18.04'] {
          fail('Only Ubunutu LTS Versions are supported')
        }
        $location = "${url}xUbuntu_${osrelease}"
      } else {
        $location = "${url}Debian_${osmajrelease}.0"
      }
      include apt
      ::apt::source { 'bareos':
        location => $location,
        release  => '/',
        repos    => '',
        key      => {
          id     => regsubst($_gpg_key_fingerprint, ' ', '', 'G'),
          source => "${location}/Release.key",
        },
      }
      Apt::Source['bareos'] -> Package<|tag == 'bareos'|>
      Class['Apt::Update']  -> Package<|tag == 'bareos'|>
    }
    default: {
      fail('Operatingsystem is not supported by this module')
    }
  }
}
