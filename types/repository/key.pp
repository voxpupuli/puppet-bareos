# @summary Bareos List data type
#
type Bareos::Repository::Key = Hash[
  id     => Optional[String[1]],
  source => Optional[Stdlib::HTTPUrl],
]
