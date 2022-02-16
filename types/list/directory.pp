# @summary Directory list: single path or array of paths
# @author Tobias @towo Wolter <tobias.wolter+voxpupuli@b1-systems.de>
type Bareos::List::Directory = Variant[
  String,
  Array[String]
]
