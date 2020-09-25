# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v1.0.0](https://github.com/voxpupuli/puppet-bareos/tree/v1.0.0) (2020-09-25)

[Full Changelog](https://github.com/voxpupuli/puppet-bareos/compare/0.4.0...v1.0.0)

**Implemented enhancements:**

- possibility to configure webui::director via hiera [\#37](https://github.com/voxpupuli/puppet-bareos/issues/37)
- Add possibility to configure defined types via hiera [\#54](https://github.com/voxpupuli/puppet-bareos/pull/54) ([benibr](https://github.com/benibr))
- configurable $config\_director\_dirs with purge option [\#43](https://github.com/voxpupuli/puppet-bareos/pull/43) ([benibr](https://github.com/benibr))

**Fixed bugs:**

- bugfix: support fact os.name VirtuozzoLinux [\#48](https://github.com/voxpupuli/puppet-bareos/pull/48) ([benibr](https://github.com/benibr))
- Allow puppetlabs/concat 6.x, puppetlabs/stdlib 6.x [\#40](https://github.com/voxpupuli/puppet-bareos/pull/40) ([dhoppe](https://github.com/dhoppe))

**Closed issues:**

- support Virtuozzolinux OS.name with facter 3.14.2 [\#47](https://github.com/voxpupuli/puppet-bareos/issues/47)
- configurable $config\_director\_dirs with purge option [\#42](https://github.com/voxpupuli/puppet-bareos/issues/42)
- possibility to configure all defined types via hiera [\#41](https://github.com/voxpupuli/puppet-bareos/issues/41)

**Merged pull requests:**

- added possibility to config storage defined types via hiera [\#64](https://github.com/voxpupuli/puppet-bareos/pull/64) ([benibr](https://github.com/benibr))
- Bugfix/fix hashes cnts dirs [\#58](https://github.com/voxpupuli/puppet-bareos/pull/58) ([benibr](https://github.com/benibr))
- modulesync 3.0.0 / Drop Ubuntu 12.04 and 14.04 / Drop Debian 7 and 8 / Drop CentOS 5 [\#53](https://github.com/voxpupuli/puppet-bareos/pull/53) ([dhoppe](https://github.com/dhoppe))
- multiple Puppetlint fixes [\#45](https://github.com/voxpupuli/puppet-bareos/pull/45) ([bastelfreak](https://github.com/bastelfreak))
- Issue \#37 added directors hash for config via hiera [\#38](https://github.com/voxpupuli/puppet-bareos/pull/38) ([benibr](https://github.com/benibr))
- Prepare migration to voxpupuli [\#36](https://github.com/voxpupuli/puppet-bareos/pull/36) ([Project0](https://github.com/Project0))

## [0.4.0](https://github.com/voxpupuli/puppet-bareos/tree/0.4.0) (2019-05-04)

[Full Changelog](https://github.com/voxpupuli/puppet-bareos/compare/0.3.1...0.4.0)

**Fixed bugs:**

- Upgrade of fd fails on Ubuntu Xenial [\#25](https://github.com/voxpupuli/puppet-bareos/issues/25)
- Workaround duplicate configs on package upgrades [\#26](https://github.com/voxpupuli/puppet-bareos/pull/26) ([Project0](https://github.com/Project0))

**Closed issues:**

- Replace APT key ID with new [\#32](https://github.com/voxpupuli/puppet-bareos/issues/32)
- bareos::director tries to collect all exported File resources [\#30](https://github.com/voxpupuli/puppet-bareos/issues/30)

**Merged pull requests:**

- Some fixes [\#35](https://github.com/voxpupuli/puppet-bareos/pull/35) ([Project0](https://github.com/Project0))
- Introduce manage\_database flag [\#34](https://github.com/voxpupuli/puppet-bareos/pull/34) ([mattiasgiese](https://github.com/mattiasgiese))
- Puppet6 compatible bareos\_settings.rb [\#33](https://github.com/voxpupuli/puppet-bareos/pull/33) ([benibr](https://github.com/benibr))
- Update dependency on puppetlabs/apt [\#31](https://github.com/voxpupuli/puppet-bareos/pull/31) ([towo](https://github.com/towo))
- Replace :undef with nil [\#29](https://github.com/voxpupuli/puppet-bareos/pull/29) ([towo](https://github.com/towo))
- Allow numbers in directive config keys [\#28](https://github.com/voxpupuli/puppet-bareos/pull/28) ([philippdieter](https://github.com/philippdieter))

## [0.3.1](https://github.com/voxpupuli/puppet-bareos/tree/0.3.1) (2018-05-06)

[Full Changelog](https://github.com/voxpupuli/puppet-bareos/compare/0.3.0...0.3.1)

**Fixed bugs:**

- bareos::director::messages has settings in the wrong order [\#17](https://github.com/voxpupuli/puppet-bareos/issues/17)
- bareos::storage class has conditionals mixed up [\#16](https://github.com/voxpupuli/puppet-bareos/issues/16)
- repository: Add missing / in yumrepo gpgkey URI. [\#13](https://github.com/voxpupuli/puppet-bareos/pull/13) ([olifre](https://github.com/olifre))
- repository: Add descr for yum repository. [\#12](https://github.com/voxpupuli/puppet-bareos/pull/12) ([olifre](https://github.com/olifre))

**Closed issues:**

- bareos::repository results in invalid url on debian [\#19](https://github.com/voxpupuli/puppet-bareos/issues/19)
- Missing "/" in GPG URL for RHEL bases OS [\#14](https://github.com/voxpupuli/puppet-bareos/issues/14)

**Merged pull requests:**

- Address must not be quoted [\#24](https://github.com/voxpupuli/puppet-bareos/pull/24) ([Project0](https://github.com/Project0))
- set rspec-puppet version to last know [\#23](https://github.com/voxpupuli/puppet-bareos/pull/23) ([Project0](https://github.com/Project0))
- repository: Fixed debian os version string [\#22](https://github.com/voxpupuli/puppet-bareos/pull/22) ([laurigates](https://github.com/laurigates))
- Fixed mixed up conditionals [\#21](https://github.com/voxpupuli/puppet-bareos/pull/21) ([laurigates](https://github.com/laurigates))
- Fix bareos mail and operator command order [\#20](https://github.com/voxpupuli/puppet-bareos/pull/20) ([laurigates](https://github.com/laurigates))

## [0.3.0](https://github.com/voxpupuli/puppet-bareos/tree/0.3.0) (2018-01-12)

[Full Changelog](https://github.com/voxpupuli/puppet-bareos/compare/0.2.1...0.3.0)

**Closed issues:**

- Fix profile fileset for bareoscatalog [\#7](https://github.com/voxpupuli/puppet-bareos/issues/7)
- Fix profile messages - log file name [\#6](https://github.com/voxpupuli/puppet-bareos/issues/6)

**Merged pull requests:**

- Fix repository with redhat based distributions and newer facter only versions [\#10](https://github.com/voxpupuli/puppet-bareos/pull/10) ([Project0](https://github.com/Project0))
- Some minor fixes [\#8](https://github.com/voxpupuli/puppet-bareos/pull/8) ([Project0](https://github.com/Project0))

## [0.2.1](https://github.com/voxpupuli/puppet-bareos/tree/0.2.1) (2017-08-18)

[Full Changelog](https://github.com/voxpupuli/puppet-bareos/compare/0.2.0...0.2.1)

**Merged pull requests:**

- Fix US-ASCII chars and runscript can be an array [\#4](https://github.com/voxpupuli/puppet-bareos/pull/4) ([Project0](https://github.com/Project0))
- type runscript can be specified as array with hashes [\#3](https://github.com/voxpupuli/puppet-bareos/pull/3) ([Project0](https://github.com/Project0))

## [0.2.0](https://github.com/voxpupuli/puppet-bareos/tree/0.2.0) (2017-08-15)

[Full Changelog](https://github.com/voxpupuli/puppet-bareos/compare/0.1.1...0.2.0)

**Merged pull requests:**

- Add specs and improve bareos type checking [\#2](https://github.com/voxpupuli/puppet-bareos/pull/2) ([Project0](https://github.com/Project0))

## [0.1.1](https://github.com/voxpupuli/puppet-bareos/tree/0.1.1) (2017-08-13)

[Full Changelog](https://github.com/voxpupuli/puppet-bareos/compare/42918c2e8e4bae289b1c0e879e1b0949ea0c1923...0.1.1)



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
