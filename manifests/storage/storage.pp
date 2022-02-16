# == Class: bareos::storage::storage
# In general, the properties specified under the Storage resource dene global properties of the Storage daemon.
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
# [*auto_x_flate_on_replication*]
#   Auto X Flate On Replication
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
# [*client_connect_wait*]
#   Client Connect Wait
#
#   Bareos Datatype: time
#   Bareos Default: 1800
#   Required: false
#
# [*collect_device_statistics*]
#   Collect Device Statistics
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*collect_job_statistics*]
#   Collect Job Statistics
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
# [*device_reserve_by_media_type*]
#   Device Reserve By Media Type
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*fd_connect_timeout*]
#   Fd Connect Timeout
#
#   Bareos Datatype: time
#   Bareos Default: 1800
#   Required: false
#
# [*file_device_concurrent_read*]
#   File Device Concurrent Read
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*heartbeat_interval*]
#   Heartbeat Interval
#
#   Bareos Datatype: time
#   Bareos Default: 0
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
# [*name_storage*]
#   Name of this storage.
#   Note: name is usually reserved by puppet for resource titles, since this is an class and not and define use name_storage.
#
#   Bareos Datatype: name
#   Bareos Default: Not set
#   Required: true
#
# [*ndmp_address*]
#   Ndmp Address
#
#   Bareos Datatype: address
#   Bareos Default: 10000
#   Required: false
#
# [*ndmp_addresses*]
#   Ndmp Addresses
#
#   Bareos Datatype: addresses
#   Bareos Default: 10000
#   Required: false
#
# [*ndmp_enable*]
#   Ndmp Enable
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*ndmp_log_level*]
#   Ndmp Log Level
#
#   Bareos Datatype: pint32
#   Bareos Default: 4
#   Required: false
#
# [*ndmp_port*]
#   Ndmp Port
#
#   Bareos Datatype: port
#   Bareos Default: 10000
#   Required: false
#
# [*ndmp_snooping*]
#   Ndmp Snooping
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*pid_directory*]
#   Pid Directory
#
#   Bareos Datatype: directory
#   Bareos Default: /var/lib/bareos
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
# [*sd_address*]
#   Sd Address
#
#   Bareos Datatype: address
#   Bareos Default: 9103
#   Required: false
#
# [*sd_addresses*]
#   Sd Addresses
#
#   Bareos Datatype: addresses
#   Bareos Default: 9103
#   Required: false
#
# [*sd_connect_timeout*]
#   Sd Connect Timeout
#
#   Bareos Datatype: time
#   Bareos Default: 1800
#   Required: false
#
# [*sd_port*]
#   Sd Port
#
#   Bareos Datatype: port
#   Bareos Default: 9103
#   Required: false
#
# [*sd_source_address*]
#   Sd Source Address
#
#   Bareos Datatype: address
#   Bareos Default: 0
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
#   Bareos Default: 30
#   Required: false
#
# [*sub_sys_directory*]
#   Sub Sys Directory
#
#   Bareos Datatype: directory
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
class bareos::storage::storage (
  Bareos::Module::Ensure $ensure = present,
  Optional[Integer[0]] $absolute_job_timeout = undef,
  Optional[Bareos::Boolean] $allow_bandwidth_bursting = undef,
  Optional[Bareos::Boolean] $auto_x_flate_on_replication = undef,
  Optional[String] $backend_directory = undef,
  Optional[Bareos::Time] $client_connect_wait = undef,
  Optional[Bareos::Boolean] $collect_device_statistics = undef,
  Optional[Bareos::Boolean] $collect_job_statistics = undef,
  Optional[Bareos::Boolean] $compatible = undef,
  Optional[String] $description = undef,
  Optional[Bareos::Boolean] $device_reserve_by_media_type = undef,
  Optional[Bareos::Time] $fd_connect_timeout = undef,
  Optional[Bareos::Boolean] $file_device_concurrent_read = undef,
  Optional[Bareos::Time] $heartbeat_interval = undef,
  Optional[String] $log_timestamp_format = undef,
  Optional[Bareos::Speed] $maximum_bandwidth_per_job = undef,
  Optional[Integer[0]] $maximum_concurrent_jobs = undef,
  Optional[Integer[0]] $maximum_connections = undef,
  Optional[Integer[0]] $maximum_network_buffer_size = undef,
  Optional[Bareos::Resource] $messages = undef,
  Bareos::Resource $name_storage = 'bareos-sd',
  Optional[Bareos::Address] $ndmp_address = undef,
  Optional[Bareos::Addresses] $ndmp_addresses = undef,
  Optional[Bareos::Boolean] $ndmp_enable = undef,
  Optional[Integer[0]] $ndmp_log_level = undef,
  Optional[Stdlib::Port] $ndmp_port = undef,
  Optional[Bareos::Boolean] $ndmp_snooping = undef,
  Optional[String] $pid_directory = undef,
  Optional[String] $plugin_directory = undef,
  Optional[Bareos::List::String] $plugin_names = undef,
  Optional[String] $scripts_directory = undef,
  Optional[Bareos::Address] $sd_address = undef,
  Optional[Bareos::Addresses] $sd_addresses = undef,
  Optional[Bareos::Time] $sd_connect_timeout = undef,
  Optional[Stdlib::Port] $sd_port = undef,
  Optional[Bareos::Address] $sd_source_address = undef,
  Optional[String] $secure_erase_command = undef,
  Optional[Integer[0]] $statistics_collect_interval = undef,
  Optional[String] $sub_sys_directory = undef,
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
  include bareos::storage

  $_resource = 'Storage'
  $_resource_dir = 'storage'

  if $ensure == 'present' {
    $_require_res_messages = $messages ? { undef => undef, default => Bareos::Storage::Messages[$messages] }

    $_require_resource = delete_undef_values([
        $_require_res_messages,
    ])

    $_settings = bareos_settings( [$name_storage, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$absolute_job_timeout, 'Absolute Job Timeout', 'pint32', false],
      [$allow_bandwidth_bursting, 'Allow Bandwidth Bursting', 'boolean', false],
      [$auto_x_flate_on_replication, 'Auto X Flate On Replication', 'boolean', false],
      [$backend_directory, 'Backend Directory', 'directory_list', false],
      [$client_connect_wait, 'Client Connect Wait', 'time', false],
      [$collect_device_statistics, 'Collect Device Statistics', 'boolean', false],
      [$collect_job_statistics, 'Collect Job Statistics', 'boolean', false],
      [$compatible, 'Compatible', 'boolean', false],
      [$device_reserve_by_media_type, 'Device Reserve By Media Type', 'boolean', false],
      [$fd_connect_timeout, 'Fd Connect Timeout', 'time', false],
      [$file_device_concurrent_read, 'File Device Concurrent Read', 'boolean', false],
      [$heartbeat_interval, 'Heartbeat Interval', 'time', false],
      [$log_timestamp_format, 'Log Timestamp Format', 'string', false],
      [$maximum_bandwidth_per_job, 'Maximum Bandwidth Per Job', 'speed', false],
      [$maximum_concurrent_jobs, 'Maximum Concurrent Jobs', 'pint32', false],
      [$maximum_connections, 'Maximum Connections', 'pint32', false],
      [$maximum_network_buffer_size, 'Maximum Network Buffer Size', 'pint32', false],
      [$messages, 'Messages', 'res', false],
      [$ndmp_address, 'Ndmp Address', 'address', false],
      [$ndmp_addresses, 'Ndmp Addresses', 'addresses', false],
      [$ndmp_enable, 'Ndmp Enable', 'boolean', false],
      [$ndmp_log_level, 'Ndmp Log Level', 'pint32', false],
      [$ndmp_port, 'Ndmp Port', 'port', false],
      [$ndmp_snooping, 'Ndmp Snooping', 'boolean', false],
      [$pid_directory, 'Pid Directory', 'directory', false],
      [$plugin_directory, 'Plugin Directory', 'directory', false],
      [$plugin_names, 'Plugin Names', 'plugin_names', false],
      [$scripts_directory, 'Scripts Directory', 'directory', false],
      [$sd_address, 'Sd Address', 'address', false],
      [$sd_addresses, 'Sd Addresses', 'addresses', false],
      [$sd_connect_timeout, 'Sd Connect Timeout', 'time', false],
      [$sd_port, 'Sd Port', 'port', false],
      [$sd_source_address, 'Sd Source Address', 'address', false],
      [$secure_erase_command, 'Secure Erase Command', 'string', false],
      [$statistics_collect_interval, 'Statistics Collect Interval', 'pint32', false],
      [$sub_sys_directory, 'Sub Sys Directory', 'directory', false],
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

  file { "${bareos::storage::config_dir}/${_resource_dir}/bareos-sd.conf":
    ensure  => $ensure,
    mode    => $bareos::file_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    content => template('bareos/resource.erb'),
    notify  => Service[$bareos::storage::service_name],
    require => $_require_resource,
    tag     => ['bareos', 'bareos_storage'],
  }
}
