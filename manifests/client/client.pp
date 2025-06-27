# @summary
#   The Client Resource (or FileDaemon) resource defines the name of the Client (as used by the Director) as well as the port on which the Client listens for Director connections.
#
# @param ensure
#   present or absent the config file.
#
# @param absolute_job_timeout
#   Absolute Job Timeout
#
#   Bareos Datatype: pint32
#   Bareos Default: Not set
#   Required: false
#
# @param allow_bandwidth_bursting
#   Allow Bandwidth Bursting
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# @param allowed_job_command
#   Allowed Job Command
#
#   May be specified as Array.
#   Bareos Datatype: string_list
#   Bareos Default: Not set
#   Required: false
#
# @param allowed_script_dir
#   Allowed Script Dir
#
#   May be specified as Array.
#   Bareos Datatype: directory_list
#   Bareos Default: Not set
#   Required: false
#
# @param always_use_lmdb
#   Always Use Lmdb
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# @param compatible
#   Compatible
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# @param description
#   Description
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# @param fd_address
#   Fd Address
#
#   Bareos Datatype: address
#   Bareos Default: 9102
#   Required: false
#
# @param fd_addresses
#   Fd Addresses
#
#   Bareos Datatype: addresses
#   Bareos Default: 9102
#   Required: false
#
# @param fd_port
#   Fd Port
#
#   Bareos Datatype: port
#   Bareos Default: 9102
#   Required: false
#
# @param fd_source_address
#   Fd Source Address
#
#   Bareos Datatype: address
#   Bareos Default: 0
#   Required: false
#
# @param heartbeat_interval
#   Heartbeat Interval
#
#   Bareos Datatype: time
#   Bareos Default: 0
#   Required: false
#
# @param lmdb_threshold
#   Lmdb Threshold
#
#   Bareos Datatype: pint32
#   Bareos Default: Not set
#   Required: false
#
# @param log_timestamp_format
#   Log Timestamp Format
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# @param maximum_bandwidth_per_job
#   Maximum Bandwidth Per Job
#
#   Bareos Datatype: speed
#   Bareos Default: Not set
#   Required: false
#
# @param maximum_concurrent_jobs
#   Maximum Concurrent Jobs
#
#   Bareos Datatype: pint32
#   Bareos Default: 20
#   Required: false
#
# @param maximum_connections
#   Maximum Connections
#
#   Bareos Datatype: pint32
#   Bareos Default: 42
#   Required: false
#
# @param maximum_network_buffer_size
#   Maximum Network Buffer Size
#
#   Bareos Datatype: pint32
#   Bareos Default: Not set
#   Required: false
#
# @param messages
#   Messages
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# @param name_client
#   Name of this client.
#   Note: name is usually reserved by puppet for resource titles, since this is an class and not and define use name_client.
#
#   Bareos Datatype: name
#   Bareos Default: Not set
#   Required: true
#
# @param pid_directory
#   Pid Directory
#
#   Bareos Datatype: directory
#   Bareos Default: /var/lib/bareos
#   Required: false
#
# @param pki_cipher
#   Pki Cipher
#
#   Bareos Datatype: encryption_cipher
#   Bareos Default: aes128
#   Required: false
#
# @param pki_encryption
#   Pki Encryption
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# @param pki_key_pair
#   Pki Key Pair
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# @param pki_master_key
#   Pki Master Key
#
#   May be specified as Array.
#   Bareos Datatype: directory_list
#   Bareos Default: Not set
#   Required: false
#
# @param pki_signatures
#   Pki Signatures
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# @param pki_signer
#   Pki Signer
#
#   May be specified as Array.
#   Bareos Datatype: directory_list
#   Bareos Default: Not set
#   Required: false
#
# @param plugin_directory
#   Plugin Directory
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# @param plugin_names
#   Plugin Names
#
#   Bareos Datatype: plugin_names
#   Bareos Default: Not set
#   Required: false
#
# @param scripts_directory
#   Scripts Directory
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# @param sd_connect_timeout
#   Sd Connect Timeout
#
#   Bareos Datatype: time
#   Bareos Default: 1800
#   Required: false
#
# @param secure_erase_command
#   Secure Erase Command: Specify command that will be called when bareos unlinks files.
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# @param tls_allowed_cn
#   Tls Allowed Cn: "Common Name"s (CNs) of the allowed peer certificates.
#
#   May be specified as Array.
#   Bareos Datatype: string_list
#   Bareos Default: Not set
#   Required: false
#
# @param tls_authenticate
#   Tls Authenticate: Use TLS only to authenticate, not for encryption.
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# @param tls_ca_certificate_dir
#   Tls Ca Certificate Dir: Path of a TLS CA certificate directory.
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# @param tls_ca_certificate_file
#   Tls Ca Certificate File: Path of a PEM encoded TLS CA certificate(s) file.
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# @param tls_certificate
#   Tls Certificate: Path of a PEM encoded TLS certificate.
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# @param tls_certificate_revocation_list
#   Tls Certificate Revocation List: Path of a Certificate Revocation List file.
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# @param tls_cipher_list
#   Tls Cipher List: List of valid TLS Ciphers.
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# @param tls_dh_file
#   Tls Dh File: Path to PEM encoded Diffie-Hellman parameter file. If this directive is specified, DH key exchange will be used for the ephemeral keying, allowing for forward secrecy of communications.
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# @param tls_enable
#   Tls Enable: Enable TLS support.
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# @param tls_key
#   Tls Key: Path of a PEM encoded private key. It must correspond to the specified "TLS Certificate".
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# @param tls_require
#   Tls Require: Without setting this to yes, Bareos can fall back to use unencryption connections. Enabling this implicietly sets "TLS Enable = yes".
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# @param tls_verify_peer
#   Tls Verify Peer: If disabled, all certificates signed by a known CA will be accepted. If enabled, the CN of a certificate must the Address or in the "TLS Allowed CN" list.
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# @param ver_id
#   Ver Id
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# @param working_directory
#   Working Directory
#
#   Bareos Datatype: directory
#   Bareos Default: /var/lib/bareos
#   Required: false
#
class bareos::client::client (
  Enum['present','absent'] $ensure = present,
  Optional[Integer[0]] $absolute_job_timeout = undef,
  Optional[Boolean] $allow_bandwidth_bursting = undef,
  Optional[Variant[Array[String[1]],String[1]]] $allowed_job_command = undef,
  Optional[Variant[Array[String[1]],String[1]]] $allowed_script_dir = undef,
  Optional[Boolean] $always_use_lmdb = undef,
  Optional[Boolean] $compatible = undef,
  Optional[String[1]] $description = undef,
  Optional[Stdlib::Host] $fd_address = undef,
  $fd_addresses = undef,
  Optional[Stdlib::Port] $fd_port = undef,
  Optional[Stdlib::Host] $fd_source_address = undef,
  Optional[String[1]] $heartbeat_interval = undef,
  Optional[Integer] $lmdb_threshold = undef,
  Optional[String[1]] $log_timestamp_format = undef,
  Optional[String[1]] $maximum_bandwidth_per_job = undef,
  Optional[Integer] $maximum_concurrent_jobs = undef,
  Optional[Integer] $maximum_connections = undef,
  Optional[Integer] $maximum_network_buffer_size = undef,
  Optional[String[1]] $messages = undef,
  String[1] $name_client = 'bareos-fd',
  Optional[String[1]] $pid_directory = undef,
  Optional[String[1]] $pki_cipher = undef,
  Optional[Boolean] $pki_encryption = undef,
  Optional[String[1]] $pki_key_pair = undef,
  Optional[Variant[Array[String[1]],String[1]]] $pki_master_key = undef,
  Optional[Boolean] $pki_signatures = undef,
  Optional[Variant[Array[String[1]],String[1]]] $pki_signer = undef,
  Optional[String[1]] $plugin_directory = undef,
  Optional[String[1]] $plugin_names = undef,
  Optional[String[1]] $scripts_directory = undef,
  Optional[String[1]] $sd_connect_timeout = undef,
  Optional[String[1]] $secure_erase_command = undef,
  Optional[Variant[Array[String[1]],String[1]]] $tls_allowed_cn = undef,
  Optional[Boolean] $tls_authenticate = undef,
  Optional[String[1]] $tls_ca_certificate_dir = undef,
  Optional[String[1]] $tls_ca_certificate_file = undef,
  Optional[String[1]] $tls_certificate = undef,
  Optional[String[1]] $tls_certificate_revocation_list = undef,
  Optional[String[1]] $tls_cipher_list = undef,
  Optional[String[1]] $tls_dh_file = undef,
  Optional[Boolean] $tls_enable = undef,
  Optional[String[1]] $tls_key = undef,
  Optional[Boolean] $tls_require = undef,
  Optional[Boolean] $tls_verify_peer = undef,
  Optional[String[1]] $ver_id = undef,
  Optional[String[1]] $working_directory = undef,
) {
  include bareos::client

  $_resource = 'Client'
  $_resource_dir = 'client'

  if $ensure == 'present' {
    $_require_res_messages = $messages ? { undef => undef, default => Bareos::Client::Messages[$messages] }

    $_require_resource = delete_undef_values([
        $_require_res_messages,
    ])

    $_settings = bareos_settings([$name_client, 'Name', 'name', true],
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
