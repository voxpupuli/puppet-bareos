# @summary Bareos
#
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatype-directory_list
#
type Bareos::DirectoryList = Array[
  Stdlib::Absolutepath
]
