# == Class: bareos::repository
# This class manages the bareos repository
# Parameters should be configured in the upper class `::bareos`.
#
# This class will be automatically included when a resource is defined.
# It is not intended to be used directly by external resources like node definitions or other modules.
class bareos::repository(
  $release = 'latest',
  $repo_avail_hash = {},
  $repo_manage_hash = undef,
) {

  $url = "http://download.bareos.org/bareos/release/${release}/"

  if versioncmp($::puppetversion, '4.0.0') >= 0 {
    $os = $facts['os']['name']
    $osrelease = $facts['os']['release']['full']
    $osmajrelease = $facts['os']['release']['major']
  } else {
    $os = $::operatingsystem
    $osrelease = $::operatingsystemrelease
    if defined('$::operatingsystemmajrelease') {
      $osmajrelease = $::operatingsystemmajrelease
    } else {
      # old revision of facter. trying to guess. alternative is to leverage on lsb.
      $osmajrelease = split($osrelease, '.')
    }
  }

  # extract current array associated to the os release
  if ( has_key($repo_avail_hash, $os) ) {
    notify {'repo_avail_hash has a os match': loglevel => debug, }
    if ( has_key($repo_avail_hash[$os], $osmajrelease) and ( $release in $repo_avail_hash[$os][$osmajrelease] ) ) {
      notify {'repo_avail_hash has a osmajrelease match': loglevel => debug, }
      $repo_avail_bareos = true
      $osreleasekey = $osmajrelease
    } elsif ( has_key($repo_avail_hash[$os], $osrelease) and ( $release in $repo_avail_hash[$os][$osrelease] ) ) {
      notify {'repo_avail_hash has a osrelease match': loglevel => debug, }
      $repo_avail_bareos = true
      $osreleasekey = $osrelease
    } else {
      $repo_avail_bareos = false
      $osreleasekey = undef
    }
  } else {
    $repo_avail_bareos = false
    $osreleasekey = undef
  }

  # check if it has been asked to manage this os as revision
  if ( $repo_avail_bareos == true ) and
    ( ( $repo_manage_hash == undef ) or
      ( ( has_key($repo_manage_hash, $os ) and ( 'all' in $repo_manage_hash[$os] or $osreleasekey in $repo_manage_hash[$os] ) ) ) ) {
    # manage the repository
    $repo_manage_bareos = true
    notify {"repo_manage_hash has a os match": loglevel => debug, }
  } else {
    $repo_manage_bareos = false
  }

  notify {"repo_avail_bareos: '${repo_avail_bareos}', repo_manage_bareos: '${repo_manage_bareos}'": loglevel => debug, }

  # Bareos repositories
  # bareos name convention make use of major version for most distribution, while make use of full version for Ubuntu. Checking both.
  #if ( $internal_repository != true ) and ( defined ('$os') and defined('$osrelease') and defined('$osmajrelease') ) and
  #  ( $release in $repo_avail_hash[$os][$osmajrelease] or $release in $repo_avail_hash[$os][$osrelease] ) and
  #  ( ( $repo_manage_hash == undef ) or ( 'all' in $repo_manage_hash[$os] or $osmajrelease in $repo_manage_hash[$os] or $osrelease in $repo_manage_hash[$os] ) ) {
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
      if $repo_manage_bareos {
        yumrepo { 'bareos':
          name     => 'bareos',
          baseurl  => $location,
          gpgcheck => '1',
          gpgkey   => "${location}repodata/repomd.xml.key",
          priority => '1',
        }
      }
    }
    # backports repositories may be considered
    /(?i:debian|ubuntu)/: {
      if $os  == 'Ubuntu' {
        $location = "${url}xUbuntu_${osrelease}"
      } else {
        $location = "${url}Debian_${osmajrelease}.0"
      }
      if $repo_manage_bareos {
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
    }
    /(?i:gentoo)/: {
      # no bareos repository
      # bareos is not yet marked as stable in Gentoo, we need to keyword it
      # latest version available is 16.2
      if ($release == 'latest' or $release > '16.2' ) {
        $gentoorelease = '16.2'
      } else {
        $gentoorelease = '15.2'
      }

      portage::package {'app-backup/bareos':
        ensure           => present,
        target           => 'puppet-bareos',
        keywords         => ['~amd64', '~x86'],
        keywords_version => "=${gentoorelease}*",
      }
    }
    default: {
      fail('Operatingsystem is not supported by this module')
    }
  }
}
