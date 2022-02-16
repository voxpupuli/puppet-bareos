# == Class: bareos::profile::director::storage
# Default storage daemon
class bareos::profile::director::storage (
  String $address = 'localhost',
  String $password = 'BareosStoragePleaseChangeMe',
) {
  ::bareos::director::storage { 'File':
    address    => $address,
    password   => $password,
    device     => 'FileStorage',
    media_type => 'File',
  }
}
