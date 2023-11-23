# == Class: bareos::profile::director::jobdefs
# Default jobdefs
class bareos::profile::director::jobdefs {
  bareos::director::jobdefs { 'DefaultJob':
    type                     => 'backup',
    file_set                 => 'LinuxAll', # selftest
    storage                  => 'File',
    pool                     => 'Incremental',
    messages                 => 'Standard',
    priority                 => 10,
    write_bootstrap          => '/var/lib/bareos/%c.bsr',
    full_backup_pool         => 'Full',
    differential_backup_pool => 'Differential',
    incremental_backup_pool  => 'Incremental',
  }

  bareos::director::jobdefs { 'BackupBareosCatalog':
    description     => 'Backup the catalog database (after the nightly save)',
    job_defs        => 'DefaultJob',
    level           => 'Full',
    file_set        => 'BareosCatalog',
    schedule_res    => 'WeeklyCycleAfterBackup',
    run_before_job  => '/usr/lib/bareos/scripts/make_catalog_backup.pl MyCatalog',
    run_after_job   => '/usr/lib/bareos/scripts/delete_catalog_backup',
    write_bootstrap => '|/usr/bin/bsmtp -h localhost -f \"\(Bareos\) \" -s \"Bootstrap for Job %j\" root@localhost',
    priority        => 11,
  }

  bareos::director::jobdefs { 'RestoreFiles':
    description => 'Standard Restore template. Only one such job is needed for all standard Jobs/Clients/Storage ...',
    type        => 'restore',
    file_set    => 'LinuxAll',
    storage     => 'File',
    pool        => 'Incremental',
    messages    => 'Standard',
    where       => '/tmp/bareos-restores',
  }
}
