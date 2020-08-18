# == Class: bareos::profile::director::fileset
# Default filesets
class bareos::profile::director::fileset {

    ::bareos::director::fileset {'BareosCatalog':
      description => 'Backup the catalog dump and Bareos configuration files.',
      include     => {
        'Options' => {
          'Signature' => 'MD5',
        },
        'File'    => [
          '/etc/bareos', # configuration
          '/var/lib/bareos',
        ],
      },
      exclude     => {
        'File'    => [
          '/var/lib/bareos/storage',
        ],
      },
    }

    ::bareos::director::fileset {'LinuxAll':
      description => 'Backup all regular filesystems, determined by filesystem type.',
      include     => {
        'Options' => {
          'Signature' => 'MD5',
          'One FS'    => 'no', # change into other filessytems
          # filesystems of given types will be backed up
          # others will be ignored
          'FS Type'   => [
            'btrfs',
            'ext2',
            'ext3',
            'ext4',
            'reiserfs',
            'jfs',
            'xfs',
            'zfs',
          ],
        },
        'File'    => [
          '/',
        ],
      },
      # Things that usually have to be excluded
      # You have to exclude /var/lib/bareos/storage
      # on your bareos server
      exclude     => {
        'File' => [
          '/var/lib/bareos',
          '/var/lib/bareos/storage',
          '/proc',
          '/tmp',
          '/.journal',
          '/.fsck',
          '/var/tmp',
          '/var/cache',
          '/var/lib/apt',
          '/var/lib/dpkg',
          '/var/lib/puppet',
          #    # Ignore database stuff; this will need to be handled
          # using some sort of a dump script
          '/var/lib/mysql',
          '/var/lib/postgresql',
          '/var/lib/ldap',
        ],
      },
    }

    ::bareos::director::fileset {'WindowsAll':
      enable_vss => true,
      include    => {
        'Options' => {
          'Signature'   => 'MD5',
          'Ignore Case' => 'yes',
          'Drive Type'  => 'fixed', # do backup only hard disks
          'WildFile'    => '"[A-Z]:/pagefile.sys"',
          'WildDir'     => [
            '"[A-Z]:/RECYCLER"',
            '"[A-Z]:/$RECYCLE.BIN"',
            '"[A-Z]:/System Volume Information"',
          ],
          'Exclude'     => 'yes',
        },
        'File'    => [
          '/',
        ],
      },
    }
}
