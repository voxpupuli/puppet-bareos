# @summary Exclude item
# @author Tobias @towo Wolter <tobias.wolter+voxpupuli@b1-systems.de>
# @see https://docs.bareos.org/Configuration/Director.html#fileset-exclude-resource
type Bareos::ExcludeItem = Struct[{
  'File' => Bareos::List::String,
}]
