# @summary Bareos
#
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatype-boolean
#
type Bareos::Boolean = Variant[
  Boolean,
  Enum[
    'yes',
    'no',
  ],
]
