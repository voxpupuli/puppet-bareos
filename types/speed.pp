# @struct Bareos bandwidth speed
# @author Tobias @towo Wolter <tobias.wolter+voxpupuli@b1-systems.de>
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatypespeed
type Bareos::Speed = Pattern[/(?i:\d+\s*(k\/s|kb\/s|m\/s|mb\/s))/]
