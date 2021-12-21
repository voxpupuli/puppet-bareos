# @summary Bareos signature algorithms
# @author Tobias @towo Wolter <tobias.wolter+voxpupuli@b1-systems.de>
# @see https://docs.bareos.org/Configuration/Director.html?highlight=sha512#config-Dir_Fileset_Include_Options_Signature
type Bareos::Signature = Enum[
  'MD5',
  'SHA1',
  'SHA256',
  'SHA512'
]
