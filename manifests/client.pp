# @summary
#
# @api private
#
class bareos::client (
) {
  assert_private()

  contain bareos::client::config
  contain bareos::client::package
  contain bareos::client::service

  Class['bareos::client::package'] -> Class['bareos::client::config']
  Class['bareos::client::config'] ~> Class['bareos::client::service']
  Class['bareos::client::package'] ~> Class['bareos::client::service']
}
