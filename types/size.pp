# @summary Size definition
# @author Tobias @towo Wolter <tobias.wolter+voxpupuli@b1-systems.de>
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatypesize
type Bareos::Size = Pattern[/(?i:^(\d+(\.\d+)?)\W*(k|kb|m|mb|g|gb)$)/]
