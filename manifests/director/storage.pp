# == Define: bareos::director::storage
# To define on what physical device the Volumes should be mounted.
# You may have one or more Storage definitions.
#
# == Parameters
# [*ensure*]
#   present or absent the config file.
#
# [*address*]
#   Address
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: true
#
# [*allow_compression*]
#   Allow Compression
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*auth_type*]
#   Auth Type
#
#   Bareos Datatype: auth_type
#   Bareos Default: None
#   Required: false
#
# [*auto_changer*]
#   Auto Changer
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*cache_status_interval*]
#   Cache Status Interval
#
#   Bareos Datatype: time
#   Bareos Default: 30
#   Required: false
#
# [*changer_device*]
#   Changer Device
#
#   Bareos Datatype: strname
#   Bareos Default: Not set
#   Required: false
#
# [*collect_statistics*]
#   Collect Statistics
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*description*]
#   Description
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*device*]
#   Device
#
#   Bareos Datatype: device
#   Bareos Default: Not set
#   Required: true
#
# [*enabled*]
#   Enabled: En- or disable this resource.
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*heartbeat_interval*]
#   Heartbeat Interval
#
#   Bareos Datatype: time
#   Bareos Default: 0
#   Required: false
#
# [*maximum_bandwidth_per_job*]
#   Maximum Bandwidth Per Job
#
#   Bareos Datatype: speed
#   Bareos Default: Not set
#   Required: false
#
# [*maximum_concurrent_jobs*]
#   Maximum Concurrent Jobs
#
#   Bareos Datatype: pint32
#   Bareos Default: 1
#   Required: false
#
# [*maximum_concurrent_read_jobs*]
#   Maximum Concurrent Read Jobs
#
#   Bareos Datatype: pint32
#   Bareos Default: 0
#   Required: false
#
# [*media_type*]
#   Media Type
#
#   Bareos Datatype: strname
#   Bareos Default: Not set
#   Required: true
#
# [*paired_storage*]
#   Paired Storage
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*password*]
#   Password
#
#   Bareos Datatype: autopassword
#   Bareos Default: Not set
#   Required: true
#
# [*port*]
#   Port
#
#   Bareos Datatype: pint32
#   Bareos Default: 9103
#   Required: false
#
# [*protocol*]
#   Protocol
#
#   Bareos Datatype: auth_protocol_type
#   Bareos Default: Native
#   Required: false
#
# [*tape_device*]
#   Tape Device
#
#   May be specified as Array.
#   Bareos Datatype: string_list
#   Bareos Default: Not set
#   Required: false
#
# [*tls_allowed_cn*]
#   Tls Allowed Cn: "Common Name"s (CNs) of the allowed peer certificates.
#
#   May be specified as Array.
#   Bareos Datatype: string_list
#   Bareos Default: Not set
#   Required: false
#
# [*tls_authenticate*]
#   Tls Authenticate: Use TLS only to authenticate, not for encryption.
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*tls_ca_certificate_dir*]
#   Tls Ca Certificate Dir: Path of a TLS CA certificate directory.
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# [*tls_ca_certificate_file*]
#   Tls Ca Certificate File: Path of a PEM encoded TLS CA certificate(s) file.
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# [*tls_certificate*]
#   Tls Certificate: Path of a PEM encoded TLS certificate.
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# [*tls_certificate_revocation_list*]
#   Tls Certificate Revocation List: Path of a Certificate Revocation List file.
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# [*tls_cipher_list*]
#   Tls Cipher List: List of valid TLS Ciphers.
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*tls_dh_file*]
#   Tls Dh File: Path to PEM encoded Diffie-Hellman parameter file. If this directive is specified, DH key exchange will be used for the ephemeral keying, allowing for forward secrecy of communications.
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# [*tls_enable*]
#   Tls Enable: Enable TLS support.
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*tls_key*]
#   Tls Key: Path of a PEM encoded private key. It must correspond to the specified "TLS Certificate".
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# [*tls_require*]
#   Tls Require: Without setting this to yes, Bareos can fall back to use unencryption connections. Enabling this implicietly sets "TLS Enable = yes".
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*tls_verify_peer*]
#   Tls Verify Peer: If disabled, all certificates signed by a known CA will be accepted. If enabled, the CN of a certificate must the Address or in the "TLS Allowed CN" list.
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*username*]
#   Username
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
define bareos::director::storage (
  $ensure = present,
  $address = undef,
  $allow_compression = undef,
  $auth_type = undef,
  $auto_changer = undef,
  $cache_status_interval = undef,
  $changer_device = undef,
  $collect_statistics = undef,
  $description = undef,
  $device = undef,
  $enabled = undef,
  $heartbeat_interval = undef,
  $maximum_bandwidth_per_job = undef,
  $maximum_concurrent_jobs = undef,
  $maximum_concurrent_read_jobs = undef,
  $media_type = undef,
  $paired_storage = undef,
  $password = undef,
  $port = undef,
  $protocol = undef,
  $tape_device = undef,
  $tls_allowed_cn = undef,
  $tls_authenticate = undef,
  $tls_ca_certificate_dir = undef,
  $tls_ca_certificate_file = undef,
  $tls_certificate = undef,
  $tls_certificate_revocation_list = undef,
  $tls_cipher_list = undef,
  $tls_dh_file = undef,
  $tls_enable = undef,
  $tls_key = undef,
  $tls_require = undef,
  $tls_verify_peer = undef,
  $username = undef,
) {
  include ::bareos::director

  $_resource = 'Storage'
  $_resource_dir = 'storage'

  unless $ensure in [ 'present', 'absent' ] {
    fail('Invalid value for ensure')
  }

  if $ensure == 'present' {
    $_require_res_storage = $paired_storage ? { undef => undef, default => Bareos::Director::Storage[$paired_storage] }

    $_require_resource = delete_undef_values([
      $_require_res_storage,
    ])

    $_settings = bareos_settings(
      [$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$address, 'Address', 'string', true],
      [$allow_compression, 'Allow Compression', 'boolean', false],
      [$auth_type, 'Auth Type', 'auth_type', false],
      [$auto_changer, 'Auto Changer', 'boolean', false],
      [$cache_status_interval, 'Cache Status Interval', 'time', false],
      [$changer_device, 'Changer Device', 'strname', false],
      [$collect_statistics, 'Collect Statistics', 'boolean', false],
      [$device, 'Device', 'resource_list', true],
      [$enabled, 'Enabled', 'boolean', false],
      [$heartbeat_interval, 'Heartbeat Interval', 'time', false],
      [$maximum_bandwidth_per_job, 'Maximum Bandwidth Per Job', 'speed', false],
      [$maximum_concurrent_jobs, 'Maximum Concurrent Jobs', 'pint32', false],
      [$maximum_concurrent_read_jobs, 'Maximum Concurrent Read Jobs', 'pint32', false],
      [$media_type, 'Media Type', 'strname', true],
      [$paired_storage, 'Paired Storage', 'res', false],
      [$password, 'Password', 'autopassword', true],
      [$port, 'Port', 'pint32', false],
      [$protocol, 'Protocol', 'auth_protocol_type', false],
      [$tape_device, 'Tape Device', 'string_list', false],
      [$tls_allowed_cn, 'Tls Allowed Cn', 'string_list', false],
      [$tls_authenticate, 'Tls Authenticate', 'boolean', false],
      [$tls_ca_certificate_dir, 'Tls Ca Certificate Dir', 'directory', false],
      [$tls_ca_certificate_file, 'Tls Ca Certificate File', 'directory', false],
      [$tls_certificate, 'Tls Certificate', 'directory', false],
      [$tls_certificate_revocation_list, 'Tls Certificate Revocation List', 'directory', false],
      [$tls_cipher_list, 'Tls Cipher List', 'string', false],
      [$tls_dh_file, 'Tls Dh File', 'directory', false],
      [$tls_enable, 'Tls Enable', 'boolean', false],
      [$tls_key, 'Tls Key', 'directory', false],
      [$tls_require, 'Tls Require', 'boolean', false],
      [$tls_verify_peer, 'Tls Verify Peer', 'boolean', false],
      [$username, 'Username', 'string', false]
    )
  } else {
    $_require_resource = undef
  }

  file { "${::bareos::director::config_dir}/${_resource_dir}/${name}.conf":
    ensure  => $ensure,
    mode    => $bareos::file_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    content => template('bareos/resource.erb'),
    notify  => Service[$bareos::director::service_name],
    require => $_require_resource,
    tag     => ['bareos', 'bareos_director'],
  }
}
