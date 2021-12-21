# == Class: bareos::director::director
# To define the Director's name and its access password used for authenticating the Console program.
# Only a single Director resource definition may appear in the Director's configuration file.
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
# [*audit_events*]
#   Audit Events
#
#   May be specified as Array.
#   Bareos Datatype: audit_command_list
#   Bareos Default: Not set
#   Required: false
#
# [*auditing*]
#   Auditing
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*backend_directory*]
#   Backend Directory
#
#   May be specified as Array.
#   Bareos Datatype: directory_list
#   Bareos Default: /usr/lib/bareos/backends
#   Required: false
#
# [*description*]
#   Description
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*dir_address*]
#   Dir Address
#
#   Bareos Datatype: address
#   Bareos Default: 9101
#   Required: false
#
# [*dir_addresses*]
#   Dir Addresses
#
#   Bareos Datatype: addresses
#   Bareos Default: 9101
#   Required: false
#
# [*dir_port*]
#   Dir Port
#
#   Bareos Datatype: port
#   Bareos Default: 9101
#   Required: false
#
# [*dir_source_address*]
#   Dir Source Address
#
#   Bareos Datatype: address
#   Bareos Default: 0
#   Required: false
#
# [*fd_connect_timeout*]
#   Fd Connect Timeout
#
#   Bareos Datatype: time
#   Bareos Default: 180
#   Required: false
#
# [*heartbeat_interval*]
#   Heartbeat Interval
#
#   Bareos Datatype: time
#   Bareos Default: 0
#   Required: false
#
# [*key_encryption_key*]
#   Key Encryption Key
#
#   Bareos Datatype: autopassword
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
# [*maximum_concurrent_jobs*]
#   Maximum Concurrent Jobs
#
#   Bareos Datatype: pint32
#   Bareos Default: 1
#   Required: false
#
# [*maximum_connections*]
#   Maximum Connections
#
#   Bareos Datatype: pint32
#   Bareos Default: 30
#   Required: false
#
# [*maximum_console_connections*]
#   Maximum Console Connections
#
#   Bareos Datatype: pint32
#   Bareos Default: 20
#   Required: false
#
# [*messages*]
#   Messages
#
#   Bareos Datatype: res
#   Bareos Default: Not set
#   Required: false
#
# [*name_director*]
#   Name of this director.
#   Note: name is usually reserved by puppet for resource titles, since this is an class and not and define use name_director.
#
#   Bareos Datatype: name
#   Bareos Default: Not set
#   Required: true
#
# [*ndmp_log_level*]
#   Ndmp Log Level
#
#   Bareos Datatype: pint32
#   Bareos Default: 4
#   Required: false
#
# [*ndmp_snooping*]
#   Ndmp Snooping
#
#   Bareos Datatype: boolean
#   Bareos Default: Not set
#   Required: false
#
# [*omit_defaults*]
#   Omit Defaults
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*optimize_for_size*]
#   Optimize For Size
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*optimize_for_speed*]
#   Optimize For Speed
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
# [*pid_directory*]
#   Pid Directory
#
#   Bareos Datatype: directory
#   Bareos Default: /var/lib/bareos
#   Required: false
#
# [*plugin_directory*]
#   Plugin Directory: Plugins are loaded from this directory. To load only specific plugins, use 'Plugin Names'.
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# [*plugin_names*]
#   Plugin Names: List of plugins, that should get loaded from 'Plugin Directory' (only basenames, '-dir.so' is added automatically). If empty, all plugins will get loaded.
#
#   Bareos Datatype: plugin_names
#   Bareos Default: Not set
#   Required: false
#
# [*query_file*]
#   Query File
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: true
#
# [*scripts_directory*]
#   Scripts Directory: This directive is currently unused.
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
# [*statistics_collect_interval*]
#   Statistics Collect Interval
#
#   Bareos Datatype: pint32
#   Bareos Default: 150
#   Required: false
#
# [*statistics_retention*]
#   Statistics Retention
#
#   Bareos Datatype: time
#   Bareos Default: 160704000
#   Required: false
#
# [*subscriptions*]
#   Subscriptions
#
#   Bareos Datatype: pint32
#   Bareos Default: 0
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
class bareos::director::director (
  Bareos::Module::Ensure $ensure = present,
  Optional[Integer[0]] $absolute_job_timeout = undef,
  Optional[Bareos::List::String] $audit_events = undef,
  Optional[Bareos::Boolean] $auditing = undef,
  Optional[Bareos::List::Directory] $backend_directory = undef,
  Optional[String] $description = undef,
  Optional[Bareos::Address] $dir_address = undef,
  Optional[Bareos::Addresses] $dir_addresses = undef,
  Optional[Stdlib::Port] $dir_port = undef,
  Optional[Bareos::Address] $dir_source_address = undef,
  Optional[Bareos::Time] $fd_connect_timeout = undef,
  Optional[Bareos::Time] $heartbeat_interval = undef,
  Optional[String] $key_encryption_key = undef,
  Optional[String] $log_timestamp_format = undef,
  Optional[Integer[0]] $maximum_concurrent_jobs = undef,
  Optional[Integer[0]] $maximum_connections = undef,
  Optional[Integer[0]] $maximum_console_connections = undef,
  Optional[Bareos::Resource] $messages = undef,
  Bareos::Resource $name_director = 'bareos-dir',
  Optional[Integer[0]] $ndmp_log_level = undef,
  Optional[Bareos::Boolean] $ndmp_snooping = undef,
  Optional[Bareos::Boolean] $omit_defaults = undef,
  Optional[Bareos::Boolean] $optimize_for_size = undef,
  Optional[Bareos::Boolean] $optimize_for_speed = undef,
  String $password = 'PleaseChangeMe',
  Optional[String] $pid_directory = undef,
  Optional[String] $plugin_directory = undef,
  Optional[String] $plugin_names = undef,
  String $query_file = '/usr/lib/bareos/scripts/query.sql',
  Optional[String] $scripts_directory = undef,
  Optional[Bareos::Time] $sd_connect_timeout = undef,
  Optional[String] $secure_erase_command = undef,
  Optional[Integer[0]] $statistics_collect_interval = undef,
  Optional[Bareos::Time] $statistics_retention = undef,
  Optional[Integer[0]] $subscriptions = undef,
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
  include bareos::director

  $_resource = 'Director'
  $_resource_dir = 'director'

  if $ensure == 'present' {
    $_require_res_messages = $messages ? { undef => undef, default => Bareos::Director::Messages[$messages] }

    $_require_resource = delete_undef_values([
        $_require_res_messages,
    ])

    $_settings = bareos_settings( [$name_director, 'Name', 'name', true],
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
