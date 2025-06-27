# @param name_storage
# @param name_dir
# @param password
# @param archive_device
#
class bareos::profile::storage (
  String[1] $name_storage              = 'bareos-sd',
  String[1] $name_dir                  = 'bareos-dir',
  String[1] $password                  = 'BareosStoragePleaseChangeMe',
  Stdlib::Absolutepath $archive_device = '/var/lib/bareos/storage',
) {
  class { 'bareos::storage::storage':
    name_storage => $name_storage,
    messages     => 'Standard',
  }

  bareos::storage::director { $name_dir:
    password => $password,
  }

  # Note: in the current implementation, the Director Name is ignored, and the message is sent to the Director that started the Job.
  bareos::storage::messages { 'Standard':
    description => 'Send relevant messages to the Director.',
    director    => "${name_dir} = all",
  }

  bareos::storage::device { 'FileStorage':
    archive_device  => $archive_device,
    media_type      => 'File',
    label_media     => true,
    random_access   => true,
    automatic_mount => true,
    removable_media => false,
    always_open     => false,
  }
}
