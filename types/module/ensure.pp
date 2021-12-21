# @summary Alias for the ensure property
# @author Tobias @towo Wolter
# @api private
type Bareos::Module::Ensure = Enum[
  'absent',
  'present'
]
