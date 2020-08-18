# Bareos Puppet Module
[![Puppet Forge](http://img.shields.io/puppetforge/v/voxpupuli/bareos.svg)](https://forge.puppetlabs.com/voxpupuli/bareos)
[![Puppet Forge score](https://img.shields.io/puppetforge/f/voxpupuli/bareos.svg)](https://forge.puppetlabs.com/voxpupuli/bareos)
[![Build Status](https://travis-ci.org/voxpupuli/puppet-bareos.svg?branch=master)](https://travis-ci.org/voxpupuli/puppet-bareos)

#### Table of Contents

1. [Description](#description)
1. [Setup requirements](#setup-requirements)
1. [Reference](#reference)
  1. [Bareos common](#class-bareos)
  1. [Client/Filedaemon](#clientfiledaemon)
  1. [Console (bconsole)](#console)
  1. [Director](#director)
  1. [Monitor (Tray)](#monitor)
  1. [Storage](#storage)
  1. [Web UI](#webui)
  1. [Hiera](#hiera)
1. [Limitations - OS compatibility, etc.](#limitations)

## Description

[Bareos](http://bareos.org/) is a 100% open source fork of the backup project from bacula.org.

This puppet module configures and manage all aspects of an complex bareos installation. Unfortunately backups cannot be handled on an standard way, so this module tends to be flexible as possible. It is recommend to make familiar with the [documentation](http://doc.bareos.org/master/html/bareos-manual-main-reference.html) of the configuration.

The bareos project is seperated into different parts which is reflected in this puppet module:
 * Director - Heart of Bareos. The director manages all aspects of where, when and how to backup your systems.
 * Client aka FileDaemon - Daemon which runs on the client to make backup of.
 * Storage - An storage daemon which stores the backups.
 * Console - Bconsole is an cli tool to work with the bareos director.
 * Monitor - Tray Monitor
 * WebUi - An Web Interface to work with the bareos director.

## Setup Requirements

The module depends on the following puppet modules:

* [Puppetlabs/stdlib](https://forge.puppet.com/puppetlabs/stdlib) - We use the following functions `delete_undef_values` and `downcase`.
* [Puppetlabs/concat](https://forge.puppet.com/puppetlabs/concat) - Only used for the `webui` configuration.
* [Puppetlabs/apt](https://forge.puppet.com/puppetlabs/apt) - Repository management for Debian based systems.
* [Darin/zypprepo](https://forge.puppetlabs.com/darin/zypprepo) - Repository management for OpenSuSE/SLES

## Usage with profiles

A good starting point is too look into the profile classes `bareos::profile::director`,`bareos::profile::storage` and `bareos::profile::client`.

Please note, this is only the minimal subset of an bareos configuration. You may use only some of the default configurations such like the schedules, messages, filesets or profiles.

It is highly recommend **not** to use sqlite3 as bareos catalog backend. Please ensure you provide an mysql or postgresql database. See also define `bareos::director::catalog` for the possible database configuration.

```puppet
# Install and configure an Director Server
$storage_password = 'Password of the storage instance',
class { '::bareos::profile::director':
  password     => 'Password of the director instance itself',
  catalog_conf => {
    'db_driver'   => 'mysql',
    'db_name'     => 'bareos_catalog',
    'db_address'  => 'fqdn',
    'db_port'     => 3306,
    'db_user'     => 'user',
    'db_password' => 'password'
  },
  storage_address => 'localhost',
  storage_password => $storage_password,
}

# add storage server to the same machine
class { '::bareos::profile::storage':
  password        => $storage_password,
  archive_device => '/var/lib/bareos/storage',
}

# add the client to the config
::bareos::director::client { 'bareos-client':
  description => 'Your fancy client to backup',
  password    => 'MyClientPasswordPleaseChange',
  address     => 'fqdn',
}

# Create an backup job by referencing to the jobDef template.
::bareos::director::job { 'backup-bareos-client':
  job_defs => 'LinuxAll',
  client   => 'bareos-client', # which client to assign this job
}
```

```puppet
# Install and configure an Client to backup
class { 'bareos::profile::client':
  name_client => 'bareos-client',
  password    => 'MyClientPasswordPleaseChange',
}
```
## Reference

All bareos configuration directives are reflected to an puppet define ressource. It has almost the following schema: ::bareos::**component**::**directive**.
There are only three exceptions were a class is used instead of an define: `bareos::client::client`, `bareos::director::director` and `bareos::storage::storage`. They are only allowed to exist once a time in the bareos configuration.

While bareos has a lot of configuration settings, most of the documentation and available parameter are inside the puppet manifests. Please consult also the bareos [documentation](http://doc.bareos.org/master/html/bareos-manual-main-reference.html).

This puppet module tries to cover all aspects of (bareos) type validation on puppet catalog compilation through the puppet parser function `bareos_settings`.

### Class bareos
This class manages the bareos common package, user/group, repo and the base configuration directory.

This class will be automatically included when a resource is defined.

Here you can define various behaviours for your setup.
```puppet
class { '::bareos':
  repo_release => '16.2', # Highly recommend to fix your bareos release. Defaults to 'latest'
  manage_repo => true, # use the internally shipped repo management
  manage_user => true, # manage the bareos user and group (usually also created by the package)
  manage_package => true, # setup the bareos-common packge
  package_name => 'bareos-common', # change the common package name (can be an array as well),
  package_ensure => present, # ensure all packages are present (affects all package components)
  service_ensure => running, # ensure all services are running (affects all service components)
}
```
### Client/FileDaemon
`Class ::bareos::client`

This class manages the bareos client (file-daemon) service, packages and configuration directory.
Parameters should be configured in the upper class `::bareos`.

This class will be automatically included when a resource is defined.
It is not intended to be used directly by external resources like node definitions or other modules.

#### Client - Class ::bareos::client::client

The Client Resource (or FileDaemon) resource defines the name of the Client (as used by the Director) as well as the port on which the Client listens for Director connections.

#### Director - Define ::bareos::client::director

The Director resource defines the name and password of the Directors that are permitted to contact this Client.

#### Messages - Define ::bareos::client::messages

The Messages resource defines how messages are to be handled and destinations to which they should be sent.

### Console
`Class ::bareos::console`

This class manages the bareos console (bconsole cli tool) package and configuration directory.
Parameters should be configured in the upper class `::bareos`.

This class will be automatically included when a resource is defined.
It is not intended to be used directly by external resources like node definitions or other modules.

#### Console - Define ::bareos::console::Console

Usually not required to define. The bareos documentation is almost the same like in the director, but its unclear what it affects regarding the bconsole.

If someone has more information, feel free to add this info ;-).

#### Director - Define ::bareos::console::director

The Director resource defines the attributes of the Director running on the network.
You may have multiple Director resource specifications in a single Console configuration file.
If you have more than one, you will be prompted to choose one when you start the Console program.

```puppet
::bareos::console::director { 'bareos-dir':
  description => 'Bareos console credentials for director connection',
  address     => 'fqdn/ip to director',
  password    => 'password',
}
```

### Director
`Class ::bareos::director`

This class manages the bareos director service, packages and configuration directory.
Parameters should be configured in the upper class `::bareos`.

This class will be automatically included when a resource is defined.
It is not intended to be used directly by external resources like node definitions or other modules.

#### Director - Class ::bareos::director::director

To define the Director's name and its access password used for authenticating the Console program.
Only a single Director resource definition may appear in the Director's configuration file.

#### Catalog - Define ::bareos::director::catalog

To define in what database to keep the list of files and the Volume names where they are backed up.
Most people only use a single catalog.
It is possible, however not adviced and not supported to use multiple catalogs.

#### Client - Define ::bareos::director::client

To define what Client is to be backed up.
You will generally have multiple Client definitions.
Each Job will reference only a single client.

#### Console - Define ::bareos::director::console

Configure an **Named Console** aka **Restricted Console**.
Both the names and the passwords in these two entries must match much as is the case for Client programs.

#### Counter - Define ::bareos::director::counter

The Counter Resource defines a counter variable that can be accessed by variable expansion used for creating Volume labels with the Label Format Dir Pool directive.

#### FileSet - Define ::bareos::director::fileset

To define the set of files to be backed up for each Client.
You may have any number of FileSets but each Job will reference only one.

FileSets do use `Include Exclude Items`, which are represented by hash. Hash values are only allowed to have other hashes, string values or array of string values.

```puppet
::bareos::director::fileset {'name':
  include     => {
    'Options' => {
      'Signature' => 'MD5',
      'WildFile'  => '/data/db*'
    },
    'File'    => [
      '/etc/',
      '/var/lib'
    ]
  }
}
```

#### Job - Define ::bareos::director::job
To define the backup/restore Jobs and to tie together the Client, FileSet and Schedule resources to be used for each Job.
Normally, you will Jobs of different names corresponding to each client (i.e. one Job per client, but a different one with a different name for each client).

Jobs does have `Run Script`, which is represented by hash. Hash values are only allowed to have other hashes, string values or array of string values (like the Include Exclude Items in Fileset).

```puppet
::bareos::director::job { 'MyJob':
  client                   => 'client resource name to backup'
  file_set                 => 'fileset resource name',
  schedule_res             => 'Schedule resource name'
  storage                  => 'storage resource name' or ['first storage', 'second storage'],
  pool                     => 'Incremental',
  messages                 => 'Standard',
  priority                 => 10,
  write_bootstrap          => '/var/lib/bareos/%c.bsr',
  full_backup_pool         => 'Full',
  differential_backup_pool => 'Differential',
  incremental_backup_pool  => 'Incremental',
  run_script               => {
    'console'         => '"update jobid=%i jobtype=A"'
    'Runs When'       => 'After',
    'Runs On Client'  => 'No',
    'Runs on Failure' => 'No',
  }
}
```
#### JobDefs - Define ::bareos::director::jobdefs
JobDefs are optional resources for providing defaults for Job resources.

Almost the same like `Job`.

#### Messages - Define ::bareos::director::messages

To define where error and information messages are to be sent or logged.
You may define multiple different message resources and hence direct particular classes of messages to different users or locations (files, ...).

#### Pool - Define ::bareos::director::pool

To define the pool of Volumes that can be used for a particular Job.
Most people use a single default Pool.
However, if you have a large number of clients or volumes, you may want to have multiple Pools.
Pools allow you to restrict a Job (or a Client) to use only a particular set of Volumes.

#### Profile - Define ::bareos::director::profile

The Profile Resource defines a set of ACLs.
Console Resources can be tight to one or more profiles, making it easier to use a common set of ACLs.


#### Schedule - Define ::bareos::director::schedule

The Schedule resource provides a means of automatically scheduling a Job
 as well as the ability to override the default Level, Pool, Storage and Messages resources.
If a Schedule resource is not referenced in a Job, the Job can only be run manually.
In general, you specify an action to be taken and when.

#### Storage - Define ::bareos::director::storage

To define on what physical device the Volumes should be mounted.
You may have one or more Storage definitions.

### Monitor
`Class ::bareos::monitor`

This class manages the bareos (tray-) monitor package and configuration directory.
Parameters should be configured in the upper class `::bareos`.

This class will be automatically included when a resource is defined.
It is not intended to be used directly by external resources like node definitions or other modules.

#### Client - Define ::bareos::monitor::client
The Client resource defines the attributes of the Clients that are monitored by this Monitor.

#### Director - Define ::bareos::monitor::director
The Director resource defines the attributes of the Directors that are monitored by this Monitor.

#### Monitor - Define ::bareos::monitor::monitor
The Monitor resource defines the attributes of the Monitor running on the network.
The parameters you define here must be configured as a Director resource
in Clients and Storages configuration files, and as a Console resource in Directors configuration files.

#### Storage - Define ::bareos::monitor::storage
The Storage resource defines the attributes of the Storages that are monitored by this Monitor.

### Storage
`Class ::bareos::storage`

This class manages the bareos storage service, packages and configuration directory.
Parameters should be configured in the upper class `::bareos`.

This class will be automatically included when a resource is defined.
It is not intended to be used directly by external resources like node definitions or other modules.

#### Storage - Class ::bareos::storage::storage

In general, the properties specified under the Storage resource define global properties of the Storage daemon.

#### Autochange - Define ::bareos::storage::autochanger

The Autochanger resource supports single or multiple drive autochangers
by grouping one or more Device resources into one unit called an autochanger in Bareos
(often referred to as a "tape library" by autochanger manufacturers).

#### Device - Define ::bareos::storage::device

The Device Resource specifies the details of each device (normally a tape drive) that can be used by the Storage daemon.
There may be multiple Device resources for a single Storage daemon.
In general, the properties specified within the Device resource are specific to the Device.

#### Director - Define ::bareos::storage::director

The Director resource specifies the Name of the Director which is permitted to use the services of the Storage daemon.
There may be multiple Director resources.
The Director Name and Password must match the corresponding values in the Director's configuration file.

#### Messages - Define ::bareos::storage::messages

The Messages resource defines how messages are to be handled and destinations to which they should be sent.

#### NDMP - Define ::bareos::storage::ndmp

The NDMP Resource specifies the authentication details of each NDMP client.
There may be multiple NDMP resources for a single Storage daemon.
In general, the properties specified within the NDMP resource are specific to one client.

### WebUI
`Class ::bareos::webui`

This class manages the bareos webui service, package and configuration.

This class will be automatically included when a resource is defined.

#### Director - Define ::bareos::webui::director

Configures an director to use with the webui.

Additional configuration is required on the **Director** server.
```puppet
# Allow access from the webui to the director

# Add user admin
::bareos::director::console { 'admin':
  password => 'admin',
  profile  => 'webui-admin',
}

::bareos::director::profile {'webui-admin':
  description        => 'bareos-webui webui-admin profile resource.',
  command_acl        => [
    '!.bvfs_clear_cache, !.exit, !.sql',
    '!configure, !create, !delete, !purge, !sqlquery, !umount, !unmount',
    '*all*',
  ],
  catalog_acl        => '*all*',
  client_acl         => '*all*',
  file_set_acl       => '*all*',
  job_acl            => '*all*',
  plugin_options_acl => '*all*',
  pool_acl           => '*all*',
  schedule_acl       => '*all*',
  storage_acl        => '*all*',
  where_acl          => '*all*',
}
```

### Hiera
Since define ressource are used in the module they can not be used directly via hiera. Execptions are ofcourse the three classes mentioned in [Reference](#reference).
But there exist hashes for the configuration directives in the `bareos::director` and the `bareos::webui` classes which can be used via hiera.

```
classes:
  - bareos::director
bareos::director::director::name_director: 'example'
bareos::director::director::password: 'foobar'
bareos::director::catalogs:
  'testing':
    db_driver: 'postgresql'
    db_name: 'test'
bareos::director::clients:
  'alice':
    address: foo.bar
    password: foobar
bareos::director::jobs:
  'backup-alice':
    messages: testing
    pool: testing
    type: backup
    client: alice
    file_set: testing

## Limitations

This module is built upon and tested against the versions of Puppet listed in the metadata.json file (i.e. the listed compatible versions on the Puppet Forge).

OS Limitations hardly depends on the availability of the bareos packages in the bareos [repository](http://download.bareos.org/bareos/release/) and the available release. Currently it has been tested on Ubuntu 14.04 and 16.04.

## Module Migration

This puppet module was originally hosted at https://github.com/Project0/puppet-bareos and has been migrated to Vox Pupuli.
