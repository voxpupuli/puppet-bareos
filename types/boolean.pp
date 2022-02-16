# @summary Bareos boolean datatype
# @author Tobias @towo Wolter <tobias.wolter+voxpupuli@b1-systems.de>
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatypeyesno
type Bareos::Boolean = Variant[
  Boolean,
  Enum['yes', 'no'],
  Enum['on', 'off']
]
