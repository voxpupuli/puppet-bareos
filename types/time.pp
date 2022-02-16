# @summary Bareos time specification
# @author Tobias @towo Wolter <tobias.wolter+voxpupuli@b1-systems.de>
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatypetime
type Bareos::Time = Variant[
  Integer,
  Pattern[/(\d+\s*(seconds|sec|s|minutes|min|hours|h|days|d|weeks|w|months|m|quarters|q|years|y)\s*)+/]
]
