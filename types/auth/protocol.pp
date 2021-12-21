# @summary Auth protocol types
# @author Tobias @towo Wolter <tobias.wolter+voxpupuli@b1-systems.de>
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatypejobprotocol
type Bareos::Auth::Protocol = Enum[
  'native',
  'ndmp',
  'ndmp_bareos',
  'ndmp_native',
]
