# @summary Bareos Resource list data type
# @author Tobias @towo Wolter <tobias.wolter+voxpupuli@b1-systems.de>
type Bareos::List::Resource = Variant[
  Bareos::Resource,
  Array[Bareos::Resource]
]
