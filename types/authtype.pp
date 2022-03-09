# @summary Bareos
#
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatype-auth_type
#
type Bareos::AuthType = Enum[
  'None',
  'Clear',
  'MD5',
]
