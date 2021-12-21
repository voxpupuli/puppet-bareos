# @summary Authentication types
# @author Tobias @towo Wolter <tobias.wolter+voxpupuli@b1-systems.de>
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatypeauthtype
type Bareos::Auth::Type = Enum[
  'none',
  'clear',
  'md5'
]
