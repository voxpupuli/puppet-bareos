# @summary Bareos device types
# @author Tobias @towo Wolter <towo+voxpupuli@b1-systems.de>
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatype-device_type
type Bareos::Device::Type = Pattern[
  /(?i:tape)/,
  /(?i:file)/,
  /(?i:fifo)/,
  /(?i:gfapi)/,
  /(?i:rados)/,
]
