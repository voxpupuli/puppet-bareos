# @summary Bareos
#
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatype-address
#
type Bareos::Address = Variant[
  Stdlib::Host,
]
