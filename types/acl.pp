# @summary Bareos
#
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatype-acl
#
type Bareos::Acl = Variant[
  String[1],
  Array[String[1]],
]
