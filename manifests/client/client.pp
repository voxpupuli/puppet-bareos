# == Class: bareos::client::client
# The Client Resource (or FileDaemon) resource defines the name of the Client (as used by the Director)
# as well as the port on which the Client listens for Director connections.
#
# == Parameters
# [*ensure*]
#   present or absent the config file.
#
# [*absolute_job_timeout*]
#   Absolute Job Timeout
#
#   Bareos Datatype: pint32
#   Bareos Default: Not set
#   Required: false
#
# [*allow_bandwidth_bursting*]
#   Allow Bandwidth Bursting
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*allowed_job_command*]
#   Allowed Job Command
#
#   May be specified as Array.
#   Bareos Datatype: string_list
#   Bareos Default: Not set
#   Required: false
#
# [*allowed_script_dir*]
#   Allowed Script Dir
#
#   May be specified as Array.
#   Bareos Datatype: directory_list
#   Bareos Default: Not set
#   Required: false
#
# [*always_use_lmdb*]
#   Always Use Lmdb
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*compatible*]
#   Compatible
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
# [*fd_address*]
#   Fd Address
#
#   Bareos Datatype: address
#   Bareos Default: 9102
#   Required: false
#
# [*fd_addresses*]
#   Fd Addresses
#
#   Bareos Datatype: addresses
#   Bareos Default: 9102
#   Required: false
#
# [*fd_port*]
#   Fd Port
#
#   Bareos Datatype: port
#   Bareos Default: 9102
#   Required: false
#
# [*fd_source_address*]
#   Fd Source Address
#
#   Bareos Datatype: address
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
# [*lmdb_threshold*]
#   Lmdb Threshold
#
#   Bareos Datatype: pint32
#   Bareos Default: Not set
#   Required: false
#
# [*log_timestamp_format*]
#   Log Timestamp Format
#
#   Bareos Datatype: string
#   Bareos Default: Not set
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
#   Bareos Default: 20
#   Required: false
#
# [*maximum_connections*]
#   Maximum Connections
#
#   Bareos Datatype: pint32
#   Bareos Default: 42
#   Required: false
#
# [*maximum_network_buffer_size*]
#   Maximum Network Buffer Size
#
#   Bareos Datatype: pint32
#   Bareos Default: Not set
#   Required: false
#
# [*messages*]
#   Messages
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*name_client*]
#   Name of this client.
#   Note: name is usually reserved by puppet for resource titles, since this is an class and not and define use name_client.
#
#   Bareos Datatype: name
#   Bareos Default: Not set
#   Required: true
#
# [*pid_directory*]
#   Pid Directory
#
#   Bareos Datatype: directory
#   Bareos Default: /var/lib/bareos
#   Required: false
#
# [*pki_cipher*]
#   Pki Cipher
#
#   Bareos Datatype: encryption_cipher
#   Bareos Default: aes128
#   Required: false
#
# [*pki_encryption*]
#   Pki Encryption
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*pki_key_pair*]
#   Pki Key Pair
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# [*pki_master_key*]
#   Pki Master Key
#
#   May be specified as Array.
#   Bareos Datatype: directory_list
#   Bareos Default: Not set
#   Required: false
#
# [*pki_signatures*]
#   Pki Signatures
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*pki_signer*]
#   Pki Signer
#
#   May be specified as Array.
#   Bareos Datatype: directory_list
#   Bareos Default: Not set
#   Required: false
#
# [*plugin_directory*]
#   Plugin Directory
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# [*plugin_names*]
#   Plugin Names
#
#   Bareos Datatype: plugin_names
#   Bareos Default: Not set
#   Required: false
#
# [*scripts_directory*]
#   Scripts Directory
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# [*sd_connect_timeout*]
#   Sd Connect Timeout
#
#   Bareos Datatype: time
#   Bareos Default: 1800
#   Required: false
#
# [*secure_erase_command*]
#   Secure Erase Command: Specify command that will be called when bareos unlinks files.
#
#   Bareos Datatype: string
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
#   Tls Dh File: Path to PEM encoded Diffie-Hellman parameter file. If this
#   directive is specified, DH key exchange will be used for the ephemeral
#   keying, allowing for forward secrecy of communications.
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
#   Tls Require: Without setting this to yes, Bareos can fall back to use
#   unencryption connections. Enabling this implicietly sets "TLS Enable = yes".
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*tls_verify_peer*]
#   Tls Verify Peer: If disabled, all certificates signed by a known CA will be
#   accepted. If enabled, the CN of a certificate must the Address or in the
#   "TLS Allowed CN" list.
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*ver_id*]
#   Ver Id
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*working_directory*]
#   Working Directory
#
#   Bareos Datatype: directory
#   Bareos Default: /var/lib/bareos
#   Required: false
#
class bareos::client::client (
  Bareos::Resource $name_client = 'bareos-fd',
  Bareos::Module::Ensure $ensure = present,
  Optional[Integer[0]] $absolute_job_timeout = undef,
  Optional[Boolean] $allow_bandwidth_bursting = undef,
  Optional[Bareos::List::String] $allowed_job_command = undef,
  Optional[Bareos::List::Directory] $allowed_script_dir = undef,
  Optional[Boolean] $always_use_lmdb = undef,
  Optional[Boolean] $compatible = undef,
  Optional[String] $description = undef,
  Optional[Bareos::Address] $fd_address = undef,
  Optional[Bareos::Addresses] $fd_addresses = undef,
  Optional[Stdlib::Port] $fd_port = undef,
  Optional[Bareos::Address] $fd_source_address = undef,
  Optional[Bareos::Time] $heartbeat_interval = undef,
  Optional[Integer[0]] $lmdb_threshold = undef,
  Optional[String] $log_timestamp_format = undef,
  Optional[Bareos::Speed] $maximum_bandwidth_per_job = undef,
  Optional[Integer[0]] $maximum_concurrent_jobs = undef,
  Optional[Integer[0]] $maximum_connections = undef,
  Optional[Integer[0]] $maximum_network_buffer_size = undef,
  Optional[Bareos::Resource] $messages = undef,
  Optional[String] $pid_directory = undef,
  Optional[Bareos::EncryptionCipher] $pki_cipher = undef,
  Optional[Bareos::Boolean] $pki_encryption = undef,
  Optional[String] $pki_key_pair = undef,
  Optional[Bareos::List::Directory] $pki_master_key = undef,
  Optional[Bareos::Boolean] $pki_signatures = undef,
  Optional[Bareos::List::Directory] $pki_signer = undef,
  Optional[String] $plugin_directory = undef,
  Optional[String] $plugin_names = undef,
  Optional[String] $scripts_directory = undef,
  Optional[Bareos::Time] $sd_connect_timeout = undef,
  Optional[String] $secure_erase_command = undef,
  Optional[Bareos::List::String] $tls_allowed_cn = undef,
  Optional[Bareos::Boolean] $tls_authenticate = undef,
  Optional[String] $tls_ca_certificate_dir = undef,
  Optional[String] $tls_ca_certificate_file = undef,
  Optional[String] $tls_certificate = undef,
  Optional[String] $tls_certificate_revocation_list = undef,
  Optional[String] $tls_cipher_list = undef,
  Optional[String] $tls_dh_file = undef,
  Optional[Bareos::Boolean] $tls_enable = undef,
  Optional[String] $tls_key = undef,
  Optional[Bareos::Boolean] $tls_require = undef,
  Optional[Bareos::Boolean] $tls_verify_peer = undef,
  Optional[String] $ver_id = undef,
  Optional[String] $working_directory = undef,
) {
  include bareos::client

  $_resource = 'Client'
  $_resource_dir = 'client'

  if $ensure == 'present' {
    $_require_res_messages = $messages ? { undef => undef, default => Bareos::Client::Messages[$messages] }

    $_require_resource = delete_undef_values([
        $_require_res_messages,
    ])

    $_settings = bareos_settings( [$name_client, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$absolute_job_timeout, 'Absolute Job Timeout', 'pint32', false],
      [$allow_bandwidth_bursting, 'Allow Bandwidth Bursting', 'boolean', false],
      [$allowed_job_command, 'Allowed Job Command', 'string_list', false],
      [$allowed_script_dir, 'Allowed Script Dir', 'directory_list', false],
      [$always_use_lmdb, 'Always Use Lmdb', 'boolean', false],
      [$compatible, 'Compatible', 'boolean', false],
      [$fd_address, 'Fd Address', 'address', false],
      [$fd_addresses, 'Fd Addresses', 'addresses', false],
      [$fd_port, 'Fd Port', 'port', false],
      [$fd_source_address, 'Fd Source Address', 'address', false],
      [$heartbeat_interval, 'Heartbeat Interval', 'time', false],
      [$lmdb_threshold, 'Lmdb Threshold', 'pint32', false],
      [$log_timestamp_format, 'Log Timestamp Format', 'string', false],
      [$maximum_bandwidth_per_job, 'Maximum Bandwidth Per Job', 'speed', false],
      [$maximum_concurrent_jobs, 'Maximum Concurrent Jobs', 'pint32', false],
      [$maximum_connections, 'Maximum Connections', 'pint32', false],
      [$maximum_network_buffer_size, 'Maximum Network Buffer Size', 'pint32', false],
      [$messages, 'Messages', 'res', false],
      [$pid_directory, 'Pid Directory', 'directory', false],
      [$pki_cipher, 'Pki Cipher', 'encryption_cipher', false],
      [$pki_encryption, 'Pki Encryption', 'boolean', false],
      [$pki_key_pair, 'Pki Key Pair', 'directory', false],
      [$pki_master_key, 'Pki Master Key', 'directory_list', false],
      [$pki_signatures, 'Pki Signatures', 'boolean', false],
      [$pki_signer, 'Pki Signer', 'directory_list', false],
      [$plugin_directory, 'Plugin Directory', 'directory', false],
      [$plugin_names, 'Plugin Names', 'plugin_names', false],
      [$scripts_directory, 'Scripts Directory', 'directory', false],
      [$sd_connect_timeout, 'Sd Connect Timeout', 'time', false],
      [$secure_erase_command, 'Secure Erase Command', 'string', false],
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
      [$ver_id, 'Ver Id', 'string', false],
      [$working_directory, 'Working Directory', 'directory', false]
    )
  } else {
    $_require_res_messages = undef
  }

  file { "${bareos::client::config_dir}/${_resource_dir}/bareos-fd.conf":
    ensure  => $ensure,
    mode    => $bareos::file_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    content => template('bareos/resource.erb'),
    notify  => Service[$bareos::client::service_name],
    require => $_require_res_messages,
    tag     => ['bareos', 'bareos_client'],
  }
}
