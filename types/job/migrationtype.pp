# @summary Type that defines what Jobs to migrate during Migration and Copy
# @author Tobias @towo Wolter <towo+voxpupuli@b1-systems.de>
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatype-migration_type
type Bareos::Job::MigrationType = Pattern[
  /(?i:SmallestVolume)/,
  /(?i:OldestVolume)/,
  /(?i:Client)/,
  /(?i:Volume)/,
  /(?i:Job)/,
  /(?i:SQLQuery)/,
  /(?i:PoolOccupancy)/,
  /(?i:PoolTime)/,
  /(?i:PoolUncopiedJobs)/
]
