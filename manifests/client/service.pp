# @summary
#   manage client service for bareos
#
# @api private
#
class bareos::client::service (
) {
  assert_private()

  if $bareos::enable_client and $bareos::manage_client_service {
    service { $bareos::client_service_name:
      ensure => $bareos::client_service_ensure,
      enable => $bareos::client_service_enable,
    }
  }
}
