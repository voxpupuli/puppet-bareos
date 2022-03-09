# @summary Bareos boolean datatype
type Bareos::Client::Config:Fd = Hash[
  Enum['fd'],
  Struct[
    {
      absolute_job_timeout            => Optional[Integer],
      allow_bandwidth_bursting        => Optional[Boolean],
      allowed_job_command             => Optional[String],
      allowed_script_dir              =>
      always_use_lmdb                 =>
      compatible                      =>
      description                     =>
      fd_address                      =>
      fd_addresses                    =>
      fd_port                         =>
      fd_source_address               =>
      heartbeat_interval              =>
      lmdb_threshold                  =>
      log_timestamp_format            =>
      maximum_bandwidth_per_job       =>
      maximum_concurrent_jobs         =>
      maximum_connections             =>
      maximum_network_buffer_size     =>
      messages                        =>
      client_name                     =>
      pid_directory                   =>
      pki_cipher                      =>
      pki_encryption                  =>
      pki_key_pair                    =>
      pki_master_key                  =>
      pki_signatures                  =>
      pki_signer                      =>
      plugin_directory                =>
      plugin_names                    =>
      scripts_directory               =>
      sd_connect_timeout              =>
      secure_erase_command            =>
      tls_allowed_cn                  =>
      tls_authenticate                =>
      tls_ca_certificate_dir          =>
      tls_ca_certificate_file         =>
      tls_certificate                 =>
      tls_certificate_revocation_list =>
      tls_cipher_list                 =>
      tls_dh_file                     =>
      tls_enable                      =>
      tls_key                         =>
      tls_protocal                    =>
      tls_require                     =>
      tls_verify_peer                 =>
      ver_id                          =>
      working_directory               =>
    }
  ]
]
