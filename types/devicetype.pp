# @summary Bareos
#
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatype-device_type
#
type Bareos::DeviceType = Enum[
  'Tape',
  'File',
  'FIFO',
  'GFAPI',
  'Rados',
  'Droplet',
]
