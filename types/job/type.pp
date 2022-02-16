# @summary Defines the various Bareos job types
# @author Tobias @towo Wolter <towo+voxpupuli@b1-systems.de>
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatype-job_type
type Bareos::Job::Type = Pattern[
  /(?i:Backup)/,
  /(?i:Restore)/,
  /(?i:Verify)/,
  /(?i:Admin)/,
  /(?i:Migrate)/,
  /(?i:Copy)/,
  /(?i:Consolidate)/
]
