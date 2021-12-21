# @summary Bareos label types (for use with tape libraries)
# @author Tobias @towo Wolter <towo+voxpupuli@b1-systems.de>
# @see https://github.com/bareos/bareos/blob/7cd54133cd9a4f206259b3612f3ad6ab7add9743/core/src/lib/generic_res.h#L59
type Bareos::Label = Pattern[
  /(?i:ANSI)/,
  /(?i:IBM)/,
  /(?i:Bareos)/
]
