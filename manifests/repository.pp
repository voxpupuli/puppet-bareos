# @summary
#   This class manages the bareos repository
#   Parameters should be configured in the upper class `bareos`.
#
#   This class will be automatically included when a resource is defined.
#   It is not intended to be used directly by external resources like node definitions or other modules.
#
# @api private
#
class bareos::repository (
) {
  assert_private()

  $schema = $bareos::repository_ssl ? {
    true    => 'https',
    default => 'http',
  }

  if $bareos::repository_subscription {
    if ! $bareos::repository_username or ! $bareos::repository_password {
      fail('You require a username (bareos::repository_username) and password (bareos::repository_password) for Bareos subscription repos.')
    }

    $host = $bareos::repository_host ? {
      undef   => 'download.bareos.com',
      default => $bareos::repository_host
    }
  } else {
    $host = $bareos::repository_host ? {
      undef   => 'download.bareos.org',
      default => $bareos::repository_host
    }
  }

  $address = "${schema}://${host}/bareos/release/${bareos::repository_release}"

  case $bareos::repository_release {
    '18.2', '19.2': {
      if $bareos::repository_subscription {
        $key_id = '641A1497F1B11BEA945F840FE5D882B28657AE28'
      } else {
        $key_id = 'A0CFE15F71F798574AB363DD118283D9A7862CEE'
      }
    }
    '20': {
      $key_id = 'C68B001F74D2F20243D0B7A20CCBA537DBE083A6'
    }
    '21': {
      $key_id = '91DA1DC3564AE20A76C4CA88E01957D6C9FED482'
    }
  }

  case $facts['os']['family'] {
    'Debian': {
      contain bareos::repository::apt
    }
    'RedHat': {
      contain bareos::repository::yum
    }
    default: {
      fail("Your OS family ${facts['os']['family']} is not supported by ${class_name}. Consider to use bareos::manage_repo: false")
    }
  }
}
