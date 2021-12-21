# @summary Bareos Resource data type
# @author Tobias @towo Wolter <tobias.wolter+voxpupuli@b1-systems.de>
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatypename
type Bareos::Resource = Pattern[/(?i:^[a-z][a-z0-9\.\-_ \$]{0,126}$)/]
