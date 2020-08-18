# == Define: bareos::director::client
# To define what Client is to be backed up.
# You will generally have multiple Client definitions.
# Each Job will reference only a single client.
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
# [*auth_type*]
#   Auth Type
#
#   Bareos Datatype: auth_type
#   Bareos Default: None
#   Required: false
#
# [*auto_prune*]
#   Auto Prune
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*catalog*]
#   Catalog
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*connection_from_client_to_director*]
#   Connection From Client To Director: The Director will accept incoming network connection from this Client.
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*connection_from_director_to_client*]
#   Connection From Director To Client: Let the Director initiate the network connection to the Client.
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*description*]
#   Description
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*enabled*]
#   Enabled: En- or disable this resource.
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*file_retention*]
#   File Retention
#
#   Bareos Datatype: time
#   Bareos Default: 5184000
#   Required: false
#
# [*hard_quota*]
#   Hard Quota
#
#   Bareos Datatype: size64
#   Bareos Default: 0
#   Required: false
#
# [*heartbeat_interval*]
#   Heartbeat Interval
#
#   Bareos Datatype: time
#   Bareos Default: 0
#   Required: false
#
# [*job_retention*]
#   Job Retention
#
#   Bareos Datatype: time
#   Bareos Default: 15552000
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
# [*ndmp_block_size*]
#   Ndmp Block Size
#
#   Bareos Datatype: pint32
#   Bareos Default: 64512
#   Required: false
#
# [*ndmp_log_level*]
#   Ndmp Log Level
#
#   Bareos Datatype: pint32
#   Bareos Default: 4
#   Required: false
#
# [*ndmp_use_lmdb*]
#   Ndmp Use Lmdb
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*passive*]
#   Passive: If enabled, the Storage Daemon will initiate the network connection to the Client. If disabled, the Client will initiate the netowrk connection to the Storage Daemon.
#
#   Bareos Datatype: boolean
#   Bareos Default: false
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
#   Bareos Default: 9102
#   Required: false
#
# [*protocol*]
#   Protocol
#
#   Bareos Datatype: auth_protocol_type
#   Bareos Default: Native
#   Required: false
#
# [*quota_include_failed_jobs*]
#   Quota Include Failed Jobs
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*soft_quota*]
#   Soft Quota
#
#   Bareos Datatype: size64
#   Bareos Default: 0
#   Required: false
#
# [*soft_quota_grace_period*]
#   Soft Quota Grace Period
#
#   Bareos Datatype: time
#   Bareos Default: 0
#   Required: false
#
# [*strict_quotas*]
#   Strict Quotas
#
#   Bareos Datatype: boolean
#   Bareos Default: false
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
define bareos::director::client (
  $ensure = present,
  $address = undef,
  $auth_type = undef,
  $auto_prune = undef,
  $catalog = undef,
  $connection_from_client_to_director = undef,
  $connection_from_director_to_client = undef,
  $description = undef,
  $enabled = undef,
  $file_retention = undef,
  $hard_quota = undef,
  $heartbeat_interval = undef,
  $job_retention = undef,
  $maximum_bandwidth_per_job = undef,
  $maximum_concurrent_jobs = undef,
  $ndmp_block_size = undef,
  $ndmp_log_level = undef,
  $ndmp_use_lmdb = undef,
  $passive = undef,
  $password = undef,
  $port = undef,
  $protocol = undef,
  $quota_include_failed_jobs = undef,
  $soft_quota = undef,
  $soft_quota_grace_period = undef,
  $strict_quotas = undef,
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

  $_resource = 'Client'
  $_resource_dir = 'client'

  unless $ensure in [ 'present', 'absent' ] {
    fail('Invalid value for ensure')
  }

  if $ensure == 'present' {
    $_require_res_catalog = $catalog ? { undef => undef, default => Bareos::Director::Catalog[$catalog] }

    $_require_resource = delete_undef_values([
      $_require_res_catalog,
    ])

    $_settings = bareos_settings(
      [$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$address, 'Address', 'string', true],
      [$auth_type, 'Auth Type', 'auth_type', false],
      [$auto_prune, 'Auto Prune', 'boolean', false],
      [$catalog, 'Catalog', 'res', false],
      [$connection_from_client_to_director, 'Connection From Client To Director', 'boolean', false],
      [$connection_from_director_to_client, 'Connection From Director To Client', 'boolean', false],
      [$enabled, 'Enabled', 'boolean', false],
      [$file_retention, 'File Retention', 'time', false],
      [$hard_quota, 'Hard Quota', 'size64', false],
      [$heartbeat_interval, 'Heartbeat Interval', 'time', false],
      [$job_retention, 'Job Retention', 'time', false],
      [$maximum_bandwidth_per_job, 'Maximum Bandwidth Per Job', 'speed', false],
      [$maximum_concurrent_jobs, 'Maximum Concurrent Jobs', 'pint32', false],
      [$ndmp_block_size, 'Ndmp Block Size', 'pint32', false],
      [$ndmp_log_level, 'Ndmp Log Level', 'pint32', false],
      [$ndmp_use_lmdb, 'Ndmp Use Lmdb', 'boolean', false],
      [$passive, 'Passive', 'boolean', false],
      [$password, 'Password', 'autopassword', true],
      [$port, 'Port', 'pint32', false],
      [$protocol, 'Protocol', 'auth_protocol_type', false],
      [$quota_include_failed_jobs, 'Quota Include Failed Jobs', 'boolean', false],
      [$soft_quota, 'Soft Quota', 'size64', false],
      [$soft_quota_grace_period, 'Soft Quota Grace Period', 'time', false],
      [$strict_quotas, 'Strict Quotas', 'boolean', false],
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
