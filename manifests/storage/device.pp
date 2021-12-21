# == Define: bareos::storage::device
# The Device Resource specifies the details of each device (normally a tape drive) that can be used by the Storage daemon.
# There may be multiple Device resources for a single Storage daemon.
# In general, the properties specified within the Device resource are specific to the Device.
#
# == Parameters
# [*ensure*]
#   present or absent the config file.
#
# [*alert_command*]
#   Alert Command
#
#   Bareos Datatype: strname
#   Bareos Default: Not set
#   Required: false
#
# [*always_open*]
#   Always Open
#
#   Bareos Datatype: bit
#   Bareos Default: on
#   Required: false
#
# [*archive_device*]
#   Archive Device
#
#   Bareos Datatype: strname
#   Bareos Default: Not set
#   Required: true
#
# [*auto_deflate*]
#   Auto Deflate
#
#   Bareos Datatype: io_direction
#   Bareos Default: Not set
#   Required: false
#
# [*auto_deflate_algorithm*]
#   Auto Deflate Algorithm
#
#   Bareos Datatype: compression_algorithm
#   Bareos Default: Not set
#   Required: false
#
# [*auto_deflate_level*]
#   Auto Deflate Level
#
#   Bareos Datatype: pint16
#   Bareos Default: 6
#   Required: false
#
# [*auto_inflate*]
#   Auto Inflate
#
#   Bareos Datatype: io_direction
#   Bareos Default: Not set
#   Required: false
#
# [*auto_select*]
#   Auto Select
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*autochanger*]
#   Autochanger
#
#   Bareos Datatype: bit
#   Bareos Default: off
#   Required: false
#
# [*automatic_mount*]
#   Automatic Mount
#
#   Bareos Datatype: bit
#   Bareos Default: off
#   Required: false
#
# [*backward_space_file*]
#   Backward Space File
#
#   Bareos Datatype: bit
#   Bareos Default: on
#   Required: false
#
# [*backward_space_record*]
#   Backward Space Record
#
#   Bareos Datatype: bit
#   Bareos Default: on
#   Required: false
#
# [*block_checksum*]
#   Block Checksum
#
#   Bareos Datatype: bit
#   Bareos Default: on
#   Required: false
#
# [*block_positioning*]
#   Block Positioning
#
#   Bareos Datatype: bit
#   Bareos Default: on
#   Required: false
#
# [*bsf_at_eom*]
#   Bsf At Eom
#
#   Bareos Datatype: bit
#   Bareos Default: off
#   Required: false
#
# [*changer_command*]
#   Changer Command
#
#   Bareos Datatype: strname
#   Bareos Default: Not set
#   Required: false
#
# [*changer_device*]
#   Changer Device
#
#   Bareos Datatype: strname
#   Bareos Default: Not set
#   Required: false
#
# [*check_labels*]
#   Check Labels
#
#   Bareos Datatype: bit
#   Bareos Default: off
#   Required: false
#
# [*close_on_poll*]
#   Close On Poll
#
#   Bareos Datatype: bit
#   Bareos Default: off
#   Required: false
#
# [*collect_statistics*]
#   Collect Statistics
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*count*]
#   Count
#
#   Bareos Datatype: pint32
#   Bareos Default: 1
#   Required: false
#
# [*description*]
#   Description: The Description directive provides easier human recognition, but is not used by Bareos directly.
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*device_options*]
#   Device Options
#
#   Bareos Datatype: string
#   Bareos Default: Not set
#   Required: false
#
# [*device_type*]
#   Device Type
#
#   Bareos Datatype: device_type
#   Bareos Default: Not set
#   Required: false
#
# [*diagnostic_device*]
#   Diagnostic Device
#
#   Bareos Datatype: strname
#   Bareos Default: Not set
#   Required: false
#
# [*drive_crypto_enabled*]
#   Drive Crypto Enabled
#
#   Bareos Datatype: boolean
#   Bareos Default: Not set
#   Required: false
#
# [*drive_index*]
#   Drive Index
#
#   Bareos Datatype: pint16
#   Bareos Default: Not set
#   Required: false
#
# [*drive_tape_alert_enabled*]
#   Drive Tape Alert Enabled
#
#   Bareos Datatype: boolean
#   Bareos Default: Not set
#   Required: false
#
# [*fast_forward_space_file*]
#   Fast Forward Space File
#
#   Bareos Datatype: bit
#   Bareos Default: on
#   Required: false
#
# [*forward_space_file*]
#   Forward Space File
#
#   Bareos Datatype: bit
#   Bareos Default: on
#   Required: false
#
# [*forward_space_record*]
#   Forward Space Record
#
#   Bareos Datatype: bit
#   Bareos Default: on
#   Required: false
#
# [*hardware_end_of_file*]
#   Hardware End Of File
#
#   Bareos Datatype: bit
#   Bareos Default: on
#   Required: false
#
# [*hardware_end_of_medium*]
#   Hardware End Of Medium
#
#   Bareos Datatype: bit
#   Bareos Default: on
#   Required: false
#
# [*label_block_size*]
#   Label Block Size
#
#   Bareos Datatype: pint32
#   Bareos Default: 64512
#   Required: false
#
# [*label_media*]
#   Label Media
#
#   Bareos Datatype: bit
#   Bareos Default: off
#   Required: false
#
# [*label_type*]
#   Label Type
#
#   Bareos Datatype: label
#   Bareos Default: Not set
#   Required: false
#
# [*maximum_block_size*]
#   Maximum Block Size
#
#   Bareos Datatype: max_blocksize
#   Bareos Default: Not set
#   Required: false
#
# [*maximum_changer_wait*]
#   Maximum Changer Wait
#
#   Bareos Datatype: time
#   Bareos Default: 300
#   Required: false
#
# [*maximum_concurrent_jobs*]
#   Maximum Concurrent Jobs
#
#   Bareos Datatype: pint32
#   Bareos Default: Not set
#   Required: false
#
# [*maximum_file_size*]
#   Maximum File Size
#
#   Bareos Datatype: size64
#   Bareos Default: 1000000000
#   Required: false
#
# [*maximum_job_spool_size*]
#   Maximum Job Spool Size
#
#   Bareos Datatype: size64
#   Bareos Default: Not set
#   Required: false
#
# [*maximum_network_buffer_size*]
#   Maximum Network Buffer Size
#
#   Bareos Datatype: pint32
#   Bareos Default: Not set
#   Required: false
#
# [*maximum_open_volumes*]
#   Maximum Open Volumes
#
#   Bareos Datatype: pint32
#   Bareos Default: 1
#   Required: false
#
# [*maximum_open_wait*]
#   Maximum Open Wait
#
#   Bareos Datatype: time
#   Bareos Default: 300
#   Required: false
#
# [*maximum_rewind_wait*]
#   Maximum Rewind Wait
#
#   Bareos Datatype: time
#   Bareos Default: 300
#   Required: false
#
# [*maximum_spool_size*]
#   Maximum Spool Size
#
#   Bareos Datatype: size64
#   Bareos Default: Not set
#   Required: false
#
# [*media_type*]
#   Media Type
#
#   Bareos Datatype: strname
#   Bareos Default: Not set
#   Required: true
#
# [*minimum_block_size*]
#   Minimum Block Size
#
#   Bareos Datatype: pint32
#   Bareos Default: Not set
#   Required: false
#
# [*mount_command*]
#   Mount Command
#
#   Bareos Datatype: strname
#   Bareos Default: Not set
#   Required: false
#
# [*mount_point*]
#   Mount Point
#
#   Bareos Datatype: strname
#   Bareos Default: Not set
#   Required: false
#
# [*no_rewind_on_close*]
#   No Rewind On Close
#
#   Bareos Datatype: boolean
#   Bareos Default: true
#   Required: false
#
# [*offline_on_unmount*]
#   Offline On Unmount
#
#   Bareos Datatype: bit
#   Bareos Default: off
#   Required: false
#
# [*query_crypto_status*]
#   Query Crypto Status
#
#   Bareos Datatype: boolean
#   Bareos Default: Not set
#   Required: false
#
# [*random_access*]
#   Random Access
#
#   Bareos Datatype: bit
#   Bareos Default: off
#   Required: false
#
# [*removable_media*]
#   Removable Media
#
#   Bareos Datatype: bit
#   Bareos Default: on
#   Required: false
#
# [*requires_mount*]
#   Requires Mount
#
#   Bareos Datatype: bit
#   Bareos Default: off
#   Required: false
#
# [*spool_directory*]
#   Spool Directory
#
#   Bareos Datatype: directory
#   Bareos Default: Not set
#   Required: false
#
# [*two_eof*]
#   Two Eof
#
#   Bareos Datatype: bit
#   Bareos Default: off
#   Required: false
#
# [*unmount_command*]
#   Unmount Command
#
#   Bareos Datatype: strname
#   Bareos Default: Not set
#   Required: false
#
# [*use_mtiocget*]
#   Use Mtiocget
#
#   Bareos Datatype: bit
#   Bareos Default: on
#   Required: false
#
# [*volume_capacity*]
#   Volume Capacity
#
#   Bareos Datatype: size64
#   Bareos Default: Not set
#   Required: false
#
# [*volume_poll_interval*]
#   Volume Poll Interval
#
#   Bareos Datatype: time
#   Bareos Default: 300
#   Required: false
#
define bareos::storage::device (
  Bareos::Module::Ensure $ensure = present,
  Optional[String] $alert_command = undef,
  Optional[Bareos::Boolean] $always_open = undef,
  Optional[String] $archive_device = undef,
  Optional[Bareos::IODirection] $auto_deflate = undef,
  Optional[Bareos::Compression] $auto_deflate_algorithm = undef,
  Optional[Integer[0]] $auto_deflate_level = undef,
  Optional[Bareos::IODirection] $auto_inflate = undef,
  Optional[Bareos::Boolean] $auto_select = undef,
  Optional[Bareos::Boolean] $autochanger = undef,
  Optional[Bareos::Boolean] $automatic_mount = undef,
  Optional[Bareos::Boolean] $backward_space_file = undef,
  Optional[Bareos::Boolean] $backward_space_record = undef,
  Optional[Bareos::Boolean] $block_checksum = undef,
  Optional[Bareos::Boolean] $block_positioning = undef,
  Optional[Bareos::Boolean] $bsf_at_eom = undef,
  Optional[String] $changer_command = undef,
  Optional[String] $changer_device = undef,
  Optional[Bareos::Boolean] $check_labels = undef,
  Optional[Bareos::Boolean] $close_on_poll = undef,
  Optional[Bareos::Boolean] $collect_statistics = undef,
  Optional[Integer[0]] $count = undef,
  Optional[String] $description = undef,
  Optional[String] $device_options = undef,
  Optional[Bareos::Device::Type] $device_type = undef,
  Optional[String] $diagnostic_device = undef,
  Optional[Bareos::Boolean] $drive_crypto_enabled = undef,
  Optional[Integer[0]] $drive_index = undef,
  Optional[Bareos::Boolean] $drive_tape_alert_enabled = undef,
  Optional[Bareos::Boolean] $fast_forward_space_file = undef,
  Optional[Bareos::Boolean] $forward_space_file = undef,
  Optional[Bareos::Boolean] $forward_space_record = undef,
  Optional[Bareos::Boolean] $hardware_end_of_file = undef,
  Optional[Bareos::Boolean] $hardware_end_of_medium = undef,
  Optional[Integer[0]] $label_block_size = undef,
  Optional[Bareos::Boolean] $label_media = undef,
  Optional[Bareos::Label] $label_type = undef,
  Optional[Integer[0]] $maximum_block_size = undef,
  Optional[Bareos::Time] $maximum_changer_wait = undef,
  Optional[Integer[0]] $maximum_concurrent_jobs = undef,
  Optional[Bareos::Size] $maximum_file_size = undef,
  Optional[Bareos::Size] $maximum_job_spool_size = undef,
  Optional[Integer[0]] $maximum_network_buffer_size = undef,
  Optional[Integer[0]] $maximum_open_volumes = undef,
  Optional[Bareos::Time] $maximum_open_wait = undef,
  Optional[Bareos::Time] $maximum_rewind_wait = undef,
  Optional[Bareos::Size] $maximum_spool_size = undef,
  Optional[String] $media_type = undef,
  Optional[Integer[0]] $minimum_block_size = undef,
  Optional[String] $mount_command = undef,
  Optional[String] $mount_point = undef,
  Optional[Bareos::Boolean] $no_rewind_on_close = undef,
  Optional[Bareos::Boolean] $offline_on_unmount = undef,
  Optional[Bareos::Boolean] $query_crypto_status = undef,
  Optional[Bareos::Boolean] $random_access = undef,
  Optional[Bareos::Boolean] $removable_media = undef,
  Optional[Bareos::Boolean] $requires_mount = undef,
  Optional[String] $spool_directory = undef,
  Optional[Bareos::Boolean] $two_eof = undef,
  Optional[String] $unmount_command = undef,
  Optional[Bareos::Boolean] $use_mtiocget = undef,
  Optional[Bareos::Size] $volume_capacity = undef,
  Optional[Bareos::Time] $volume_poll_interval = undef,
) {
  include bareos::storage

  $_resource = 'Device'
  $_resource_dir = 'device'

  if $ensure == 'present' {
    $_settings = bareos_settings( [$name, 'Name', 'name', true],
      [$description, 'Description', 'string', false],
      [$alert_command, 'Alert Command', 'strname', false],
      [$always_open, 'Always Open', 'bit', false],
      [$archive_device, 'Archive Device', 'strname', true],
      [$auto_deflate, 'Auto Deflate', 'io_direction', false],
      [$auto_deflate_algorithm, 'Auto Deflate Algorithm', 'compression_algorithm', false],
      [$auto_deflate_level, 'Auto Deflate Level', 'pint16', false],
      [$auto_inflate, 'Auto Inflate', 'io_direction', false],
      [$auto_select, 'Auto Select', 'boolean', false],
      [$autochanger, 'Autochanger', 'bit', false],
      [$automatic_mount, 'Automatic Mount', 'bit', false],
      [$backward_space_file, 'Backward Space File', 'bit', false],
      [$backward_space_record, 'Backward Space Record', 'bit', false],
      [$block_checksum, 'Block Checksum', 'bit', false],
      [$block_positioning, 'Block Positioning', 'bit', false],
      [$bsf_at_eom, 'Bsf At Eom', 'bit', false],
      [$changer_command, 'Changer Command', 'strname', false],
      [$changer_device, 'Changer Device', 'strname', false],
      [$check_labels, 'Check Labels', 'bit', false],
      [$close_on_poll, 'Close On Poll', 'bit', false],
      [$collect_statistics, 'Collect Statistics', 'boolean', false],
      [$count, 'Count', 'pint32', false],
      [$device_options, 'Device Options', 'string', false],
      [$device_type, 'Device Type', 'device_type', false],
      [$diagnostic_device, 'Diagnostic Device', 'strname', false],
      [$drive_crypto_enabled, 'Drive Crypto Enabled', 'boolean', false],
      [$drive_index, 'Drive Index', 'pint16', false],
      [$drive_tape_alert_enabled, 'Drive Tape Alert Enabled', 'boolean', false],
      [$fast_forward_space_file, 'Fast Forward Space File', 'bit', false],
      [$forward_space_file, 'Forward Space File', 'bit', false],
      [$forward_space_record, 'Forward Space Record', 'bit', false],
      [$hardware_end_of_file, 'Hardware End Of File', 'bit', false],
      [$hardware_end_of_medium, 'Hardware End Of Medium', 'bit', false],
      [$label_block_size, 'Label Block Size', 'pint32', false],
      [$label_media, 'Label Media', 'bit', false],
      [$label_type, 'Label Type', 'label', false],
      [$maximum_block_size, 'Maximum Block Size', 'max_blocksize', false],
      [$maximum_changer_wait, 'Maximum Changer Wait', 'time', false],
      [$maximum_concurrent_jobs, 'Maximum Concurrent Jobs', 'pint32', false],
      [$maximum_file_size, 'Maximum File Size', 'size64', false],
      [$maximum_job_spool_size, 'Maximum Job Spool Size', 'size64', false],
      [$maximum_network_buffer_size, 'Maximum Network Buffer Size', 'pint32', false],
      [$maximum_open_volumes, 'Maximum Open Volumes', 'pint32', false],
      [$maximum_open_wait, 'Maximum Open Wait', 'time', false],
      [$maximum_rewind_wait, 'Maximum Rewind Wait', 'time', false],
      [$maximum_spool_size, 'Maximum Spool Size', 'size64', false],
      [$media_type, 'Media Type', 'strname', true],
      [$minimum_block_size, 'Minimum Block Size', 'pint32', false],
      [$mount_command, 'Mount Command', 'strname', false],
      [$mount_point, 'Mount Point', 'strname', false],
      [$no_rewind_on_close, 'No Rewind On Close', 'boolean', false],
      [$offline_on_unmount, 'Offline On Unmount', 'bit', false],
      [$query_crypto_status, 'Query Crypto Status', 'boolean', false],
      [$random_access, 'Random Access', 'bit', false],
      [$removable_media, 'Removable Media', 'bit', false],
      [$requires_mount, 'Requires Mount', 'bit', false],
      [$spool_directory, 'Spool Directory', 'directory', false],
      [$two_eof, 'Two Eof', 'bit', false],
      [$unmount_command, 'Unmount Command', 'strname', false],
      [$use_mtiocget, 'Use Mtiocget', 'bit', false],
      [$volume_capacity, 'Volume Capacity', 'size64', false],
      [$volume_poll_interval, 'Volume Poll Interval', 'time', false]
    )
  }

  file { "${bareos::storage::config_dir}/${_resource_dir}/${name}.conf":
    ensure  => $ensure,
    mode    => $bareos::file_mode,
    owner   => $bareos::file_owner,
    group   => $bareos::file_group,
    content => template('bareos/resource.erb'),
    notify  => Service[$bareos::storage::service_name],
    tag     => ['bareos', 'bareos_storage'],
  }
}
