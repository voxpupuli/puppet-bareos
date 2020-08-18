# == Define: bareos::director::console
# Configure an **Named Console** aka **Restricted Console**.
# Both the names and the passwords in these two entries must match much as is the case for Client programs.
#
# == Parameters
# [*ensure*]
#   present or absent the config file.
#
# [*catalog_acl*]
#   Catalog ACL
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# [*client_acl*]
#   Client ACL
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# [*command_acl*]
#   Command ACL
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# [*description*]
#   Description
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*file_set_acl*]
#   File Set ACL
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# [*job_acl*]
#   Job ACL
#
#   Bareos Datatype: acl
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
# [*plugin_options_acl*]
#   Plugin Options ACL
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# [*pool_acl*]
#   Pool ACL
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# [*profile*]
#   Profile: Profiles can be assigned to a Console. ACL are checked until either a deny ACL is found or an allow ACL. First the console ACL is checked then any profile the console is linked to.
#
#   May be specified as Array.
#   Bareos Datatype: resource_list
#   Bareos Default: Not set
#   Required: false
#
# [*run_acl*]
#   Run ACL
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# [*schedule_acl*]
#   Schedule ACL
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
# [*storage_acl*]
#   Storage ACL
#
#   Bareos Datatype: acl
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
# [*where_acl*]
#   Where ACL
#
#   Bareos Datatype: acl
#   Bareos Default: Not set
#   Required: false
#
define bareos::director::console (
  $ensure = present,
  $catalog_acl = undef,
  $client_acl = undef,
  $command_acl = undef,
  $description = undef,
  $file_set_acl = undef,
  $job_acl = undef,
  $password = undef,
  $plugin_options_acl = undef,
  $pool_acl = undef,
  $profile = undef,
  $run_acl = undef,
  $schedule_acl = undef,
  $storage_acl = undef,
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
  $where_acl = undef,
) {
  include ::bareos::director

  $_resource = 'Console'
  $_resource_dir = 'console'

  unless $ensure in [ 'present', 'absent' ] {
    fail('Invalid value for ensure')
  }

  if $ensure == 'present' {
    $_require_res_profiles = $profile ? { undef => undef, default => Bareos::Director::Profile[$profile] }

    $_require_resource = delete_undef_values([
      $_require_res_profiles,
    ])

    $_settings = bareos_settings(
      [$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$catalog_acl, 'Catalog ACL', 'acl', false],
      [$client_acl, 'Client ACL', 'acl', false],
      [$command_acl, 'Command ACL', 'acl', false],
      [$file_set_acl, 'File Set ACL', 'acl', false],
      [$job_acl, 'Job ACL', 'acl', false],
      [$password, 'Password', 'autopassword', true],
      [$plugin_options_acl, 'Plugin Options ACL', 'acl', false],
      [$pool_acl, 'Pool ACL', 'acl', false],
      [$profile, 'Profile', 'resource_list', false],
      [$run_acl, 'Run ACL', 'acl', false],
      [$schedule_acl, 'Schedule ACL', 'acl', false],
      [$storage_acl, 'Storage ACL', 'acl', false],
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
      [$where_acl, 'Where ACL', 'acl', false]
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
