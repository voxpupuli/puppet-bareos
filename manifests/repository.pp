# == Class: bareos::repository
# This class manages the bareos repository
# Parameters should be configured in the upper class `::bareos`.
#
# This class will be automatically included when a resource is defined.
# It is not intended to be used directly by external resources like node definitions or other modules.
class bareos::repository(
  $release = 'latest'
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

  case $os {
      /(?i:redhat|centos|fedora)/: {
        case $os {
          'RedHat': {
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
        $location = "${url}Debian_${osrelease}.0"
      }
      include ::apt
      ::apt::source { 'bareos':
        location => $location,
        release  => '/',
        repos    => '',
        key      => {
          id     => '0143857D9CE8C2D182FE2631F93C028C093BFBA2',
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
