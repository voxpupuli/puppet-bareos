# @summary Include item
# @author Tobias @towo Wolter <tobias.wolter+voxpupuli@b1-systems.de>
# @see https://docs.bareos.org/Configuration/Director.html#fileset-include
type Bareos::IncludeItem = Struct[{
  'File' => Bareos::List::String,
  Optional['Exclude Dir Containing'] => String,
  Optional['Plugin'] => Bareos::List::String,
  Optional['Options'] => Bareos::FilesetOptions,
}]
