# @summary Bareos
#
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatype-auth_protocol_type
#
type Bareos::AuthProtocolType = Enum[
  'Native',
  'NDMPV2',
  'NDMPV3',
  'NDMPV4',
]
