# == Class: bareos::profile::director::storage
# Default storage daemon
class bareos::profile::director::storage (
  $address = 'localhost',
  $password = 'BareosStoragePleaseChangeMe',
) {
  bareos::director::storage { 'File':
    address    => $address,
    password   => $password,
    device     => 'FileStorage',
    media_type => 'File',
  }
}
