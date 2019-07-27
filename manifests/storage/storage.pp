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
  $ensure = present,
  $absolute_job_timeout = undef,
  $allow_bandwidth_bursting = undef,
  $auto_x_flate_on_replication = undef,
  $backend_directory = undef,
  $client_connect_wait = undef,
  $collect_device_statistics = undef,
  $collect_job_statistics = undef,
  $compatible = undef,
  $description = undef,
  $device_reserve_by_media_type = undef,
  $fd_connect_timeout = undef,
  $file_device_concurrent_read = undef,
  $heartbeat_interval = undef,
  $log_timestamp_format = undef,
  $maximum_bandwidth_per_job = undef,
  $maximum_concurrent_jobs = undef,
  $maximum_connections = undef,
  $maximum_network_buffer_size = undef,
  $messages = undef,
  $name_storage = 'bareos-sd',
  $ndmp_address = undef,
  $ndmp_addresses = undef,
  $ndmp_enable = undef,
  $ndmp_log_level = undef,
  $ndmp_port = undef,
  $ndmp_snooping = undef,
  $pid_directory = undef,
  $plugin_directory = undef,
  $plugin_names = undef,
  $scripts_directory = undef,
  $sd_address = undef,
  $sd_addresses = undef,
  $sd_connect_timeout = undef,
  $sd_port = undef,
  $sd_source_address = undef,
  $secure_erase_command = undef,
  $statistics_collect_interval = undef,
  $sub_sys_directory = undef,
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
  include bareos::storage

  $_resource = 'Storage'
  $_resource_dir = 'storage'

  unless $ensure in [ 'present', 'absent' ] {
    fail('Invalid value for ensure')
  }

  if $ensure == 'present' {
    $_require_res_messages = $messages ? { undef => undef, default => Bareos::Storage::Messages[$messages] }

    $_require_resource = delete_undef_values([
      $_require_res_messages,
    ])

    $_settings = bareos_settings(
      [$name_storage, 'Name', 'name', true],
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

  file { "${::bareos::storage::config_dir}/${_resource_dir}/bareos-sd.conf":
    ensure  => $ensure,
    mode    => $::bareos::file_mode,
    owner   => $::bareos::file_owner,
    group   => $::bareos::file_group,
    content => template('bareos/resource.erb'),
    notify  => Service[$::bareos::storage::service_name],
    require => $_require_resource,
    tag     => ['bareos', 'bareos_storage'],
  }
}
