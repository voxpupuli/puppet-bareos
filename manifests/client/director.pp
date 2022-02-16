# == Define: bareos::client::director
# The Director resource defines the name and password of the Directors that are permitted to contact this Client.
#
# == Parameters
# [*ensure*]
#   present or absent the config file.
#
# [*address*]
#   Address: Director Network Address. Only required if "Connection From Client To Director" is enabled.
#
#   Bareos Datatype: string
#   Bareos Default: Not set
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
# [*connection_from_client_to_director*]
#   Connection From Client To Director: Let the Filedaemon initiate network connections to the Director.
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*connection_from_director_to_client*]
#   Connection From Director To Client: This Client will accept incoming network connection from this Director.
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
# [*maximum_bandwidth_per_job*]
#   Maximum Bandwidth Per Job
#
#   Bareos Datatype: speed
#   Bareos Default: Not set
#   Required: false
#
# [*monitor*]
#   Monitor
#
#   Bareos Datatype: boolean
#   Bareos Default: false
#   Required: false
#
# [*password*]
#   Password
#
#   Bareos Datatype: md5password
#   Bareos Default: Not set
#   Required: true
#
# [*port*]
#   Port: Director Network Port. Only used if "Connection From Client To Director" is enabled.
#
#   Bareos Datatype: pint32
#   Bareos Default: 9101
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
define bareos::client::director (
  Bareos::Module::Ensure $ensure = present,
  Optional[String] $address = undef,
  Optional[Bareos::List::String] $allowed_job_command = undef,
  Optional[Bareos::List::Directory] $allowed_script_dir = undef,
  Optional[Bareos::Boolean] $connection_from_client_to_director = undef,
  Optional[Bareos::Boolean] $connection_from_director_to_client = undef,
  Optional[String] $description = undef,
  Optional[Bareos::Speed] $maximum_bandwidth_per_job = undef,
  Optional[Bareos::Boolean] $monitor = undef,
  Optional[String] $password = undef,
  Optional[Stdlib::Port] $port = undef,
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
) {
  include bareos::client

  $_resource = 'Director'
  $_resource_dir = 'director'

  if $ensure == 'present' {
    $_settings = bareos_settings( [$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$address, 'Address', 'string', false],
      [$allowed_job_command, 'Allowed Job Command', 'string_list', false],
      [$allowed_script_dir, 'Allowed Script Dir', 'directory_list', false],
      [$connection_from_client_to_director, 'Connection From Client To Director', 'boolean', false],
      [$connection_from_director_to_client, 'Connection From Director To Client', 'boolean', false],
      [$maximum_bandwidth_per_job, 'Maximum Bandwidth Per Job', 'speed', false],
      [$monitor, 'Monitor', 'boolean', false],
      [$password, 'Password', 'md5password', true],
      [$port, 'Port', 'pint32', false],
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
      [$tls_verify_peer, 'Tls Verify Peer', 'boolean', false]
    )
  }

  file { "${bareos::client::config_dir}/${_resource_dir}/${name}.conf":
    ensure  => $ensure,
    mode    => $bareos::file_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    content => template('bareos/resource.erb'),
    notify  => Service[$bareos::client::service_name],
    tag     => ['bareos', 'bareos_client'],
  }
}
