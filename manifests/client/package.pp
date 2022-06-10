# @summary
#   manage client packages for bareos
#
# @api private
#
class bareos::client::package (
) {
  assert_private()

  if $bareos::enable_client and $bareos::manage_client_package {
    $bareos::client_packages.each |$client_package| {
      package { $client_package:
        ensure => $bareos::client_package_ensure,
      }
    }
  }
}
