# @summary
#   Default storage daemon
# @param address
# @param password
class bareos::profile::director::storage (
  Stdlib::Host $address = 'localhost',
  String[1] $password   = 'BareosStoragePleaseChangeMe',
) {
  bareos::director::storage { 'File':
    address    => $address,
    password   => $password,
    device     => 'FileStorage',
    media_type => 'File',
  }
}
