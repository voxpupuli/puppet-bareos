# @summary I/O direction setting
# @author Tobias @towo Wolter <towo+voxpupuli@b1-systems.de>
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatype-io_direction
type Bareos::IODirection = Enum[
  'in',
  'out',
  'both'
]
