# @summary Backup job level
# @author Tobias @towo Wolter <towo+voxpupuli@b1-systems.de>
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatype-backup_level
type Bareos::Job::Level = Pattern[
  /(?i:Full)/,
  /(?i:Differential)/,
  /(?i:Incremental)/,
  /(?i:VirtualFull)/,
  /(?i:InitCatalog)/,
  /(?i:Catalog)/,
  /(?i:VolumeToCatalog)/,
  /(?i:DiskToCatalog)/,
]
