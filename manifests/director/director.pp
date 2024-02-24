# @summary
#   To define the director's name and its access password used for authenticating the console program. Only a single director resource definition may appear in the director's configuration file.
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
# @param audit_events
#   Audit Events
#
#   May be specified as Array.
#   Bareos Datatype: audit_command_list
#   Bareos Default: Not set
#   Required: false
#
# @param auditing
#   Auditing
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# @param backend_directory
#   Backend Directory
#
#   May be specified as Array.
#   Bareos Datatype: directory_list
#   Bareos Default: /usr/lib/bareos/backends
#   Required: false
#
# @param description
#   Description
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# @param dir_address
#   Dir Address
#
#   Bareos Datatype: address
#   Bareos Default: 9101
#   Required: false
#
# @param dir_addresses
#   Dir Addresses
#
#   Bareos Datatype: addresses
#   Bareos Default: 9101
#   Required: false
#
# @param dir_port
#   Dir Port
#
#   Bareos Datatype: port
#   Bareos Default: 9101
#   Required: false
#
# @param dir_source_address
#   Dir Source Address
#
#   Bareos Datatype: address
#   Bareos Default: 0
#   Required: false
#
# @param fd_connect_timeout
#   Fd Connect Timeout
#
#   Bareos Datatype: time
#   Bareos Default: 180
#   Required: false
#
# @param heartbeat_interval
#   Heartbeat Interval
#
#   Bareos Datatype: time
#   Bareos Default: 0
#   Required: false
#
# @param key_encryption_key
#   Key Encryption Key
#
#   Bareos Datatype: autopassword
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
# @param maximum_concurrent_jobs
#   Maximum Concurrent Jobs
#
#   Bareos Datatype: pint32
#   Bareos Default: 1
#   Required: false
#
# @param maximum_connections
#   Maximum Connections
#
#   Bareos Datatype: pint32
#   Bareos Default: 30
#   Required: false
#
# @param maximum_console_connections
#   Maximum Console Connections
#
#   Bareos Datatype: pint32
#   Bareos Default: 20
#   Required: false
#
# @param messages
#   Messages
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# @param name_director
#   Name of this director.
#   Note: name is usually reserved by puppet for resource titles, since this is an class and not and define use name_director.
#
#   Bareos Datatype: name
#   Bareos Default: Not set
#   Required: true
#
# @param ndmp_log_level
#   Ndmp Log Level
#
#   Bareos Datatype: pint32
#   Bareos Default: 4
#   Required: false
#
# @param ndmp_snooping
#   Ndmp Snooping
#
#   Bareos Datatype: boolean
#   Bareos Default: Not set
#   Required: false
#
# @param omit_defaults
#   Omit Defaults
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# @param optimize_for_size
#   Optimize For Size
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# @param optimize_for_speed
#   Optimize For Speed
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# @param password
#   Password
#
#   Bareos Datatype: autopassword
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
# @param plugin_directory
#   Plugin Directory: Plugins are loaded from this directory. To load only specific plugins, use 'Plugin Names'.
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# @param plugin_names
#   Plugin Names: List of plugins, that should get loaded from 'Plugin Directory' (only basenames, '-dir.so' is added automatically). If empty, all plugins will get loaded.
#
#   Bareos Datatype: plugin_names
#   Bareos Default: Not set
#   Required: false
#
# @param query_file
#   Query File
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: true
#
# @param scripts_directory
#   Scripts Directory: This directive is currently unused.
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
# @param statistics_collect_interval
#   Statistics Collect Interval
#
#   Bareos Datatype: pint32
#   Bareos Default: 150
#   Required: false
#
# @param statistics_retention
#   Statistics Retention
#
#   Bareos Datatype: time
#   Bareos Default: 160704000
#   Required: false
#
# @param subscriptions
#   Subscriptions
#
#   Bareos Datatype: pint32
#   Bareos Default: 0
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
class bareos::director::director (
  $ensure = present,
  $absolute_job_timeout = undef,
  $audit_events = undef,
  $auditing = undef,
  $backend_directory = undef,
  $description = undef,
  $dir_address = undef,
  $dir_addresses = undef,
  $dir_port = undef,
  $dir_source_address = undef,
  $fd_connect_timeout = undef,
  $heartbeat_interval = undef,
  $key_encryption_key = undef,
  $log_timestamp_format = undef,
  $maximum_concurrent_jobs = undef,
  $maximum_connections = undef,
  $maximum_console_connections = undef,
  $messages = undef,
  $name_director = 'bareos-dir',
  $ndmp_log_level = undef,
  $ndmp_snooping = undef,
  $omit_defaults = undef,
  $optimize_for_size = undef,
  $optimize_for_speed = undef,
  $password = 'PleaseChangeMe',
  $pid_directory = undef,
  $plugin_directory = undef,
  $plugin_names = undef,
  $query_file = '/usr/lib/bareos/scripts/query.sql',
  $scripts_directory = undef,
  $sd_connect_timeout = undef,
  $secure_erase_command = undef,
  $statistics_collect_interval = undef,
  $statistics_retention = undef,
  $subscriptions = undef,
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
  $ver_id = undef,
  $working_directory = undef,
) {
  include bareos::director

  $_resource = 'Director'
  $_resource_dir = 'director'

  unless $ensure in ['present', 'absent'] {
    fail('Invalid value for ensure')
  }

  if $ensure == 'present' {
    $_require_res_messages = $messages ? { undef => undef, default => Bareos::Director::Messages[$messages] }

    $_require_resource = delete_undef_values([
        $_require_res_messages,
    ])

    $_settings = bareos_settings([$name_director, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$absolute_job_timeout, 'Absolute Job Timeout', 'pint32', false],
      [$audit_events, 'Audit Events', 'audit_command_list', false],
      [$auditing, 'Auditing', 'boolean', false],
      [$backend_directory, 'Backend Directory', 'directory_list', false],
      [$dir_address, 'Dir Address', 'address', false],
      [$dir_addresses, 'Dir Addresses', 'addresses', false],
      [$dir_port, 'Dir Port', 'port', false],
      [$dir_source_address, 'Dir Source Address', 'address', false],
      [$fd_connect_timeout, 'Fd Connect Timeout', 'time', false],
      [$heartbeat_interval, 'Heartbeat Interval', 'time', false],
      [$key_encryption_key, 'Key Encryption Key', 'autopassword', false],
      [$log_timestamp_format, 'Log Timestamp Format', 'string', false],
      [$maximum_concurrent_jobs, 'Maximum Concurrent Jobs', 'pint32', false],
      [$maximum_connections, 'Maximum Connections', 'pint32', false],
      [$maximum_console_connections, 'Maximum Console Connections', 'pint32', false],
      [$messages, 'Messages', 'res', false],
      [$ndmp_log_level, 'Ndmp Log Level', 'pint32', false],
      [$ndmp_snooping, 'Ndmp Snooping', 'boolean', false],
      [$omit_defaults, 'Omit Defaults', 'boolean', false],
      [$optimize_for_size, 'Optimize For Size', 'boolean', false],
      [$optimize_for_speed, 'Optimize For Speed', 'boolean', false],
      [$password, 'Password', 'autopassword', true],
      [$pid_directory, 'Pid Directory', 'directory', false],
      [$plugin_directory, 'Plugin Directory', 'directory', false],
      [$plugin_names, 'Plugin Names', 'plugin_names', false],
      [$query_file, 'Query File', 'directory', true],
      [$scripts_directory, 'Scripts Directory', 'directory', false],
      [$sd_connect_timeout, 'Sd Connect Timeout', 'time', false],
      [$secure_erase_command, 'Secure Erase Command', 'string', false],
      [$statistics_collect_interval, 'Statistics Collect Interval', 'pint32', false],
      [$statistics_retention, 'Statistics Retention', 'time', false],
      [$subscriptions, 'Subscriptions', 'pint32', false],
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
    $_require_resource = undef
  }

  file { "${bareos::director::config_dir}/${_resource_dir}/bareos-dir.conf":
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
