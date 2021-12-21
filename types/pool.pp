# @summary Possible Bareos Pool types
# @author Tobias @towo Wolter <towo+voxpupuli@b1-systems.de>
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatype-pooltype
type Bareos::Pool = Pattern[
  /(?i:Backup)/,
  /(?i:Archive)/,
  /(?i:Cloned)/,
  /(?i:Migration)/,
  /(?i:Copy)/,
  /(?i:Save)/
]
