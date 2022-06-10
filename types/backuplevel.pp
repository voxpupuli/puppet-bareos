# @summary Bareos
#
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatype-backup_level
#
type Bareos::BackupLevel = Enum[
  'Full',
  'Differential',
  'Incremental',
  'VirtualFull',
  'InitCatalog',
  'Catalog',
  'VolumeToCatalog',
  'DiskToCatalog',
]
