# @summary Replace options for a Bareos Restore job
# @author Tobias @towo Wolter <towo+voxpupuli@b1-systems.de>
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatype-replace_option
type Bareos::Job::ReplaceOption = Enum[
  'always',
  'ifnewer',
  'ifolder',
  'never'
]
