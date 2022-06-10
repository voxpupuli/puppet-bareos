# @summary Bareos
#
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatype-action_on_purge
#
type Bareos::ActionOnPurge = Enum[
  'truncate',
]
