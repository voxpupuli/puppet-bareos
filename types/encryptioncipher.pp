# @summary Valid encryption ciphers for Bareos.
# @author Tobias @towo Wolter <tobias.wolter+voxpupuli@b1-systems.de>
# @see https://docs.bareos.org/Configuration/FileDaemon.html?highlight=aes128#config-Fd_Client_PkiCipher
type Bareos::EncryptionCipher = Enum[
  'aes128',
  'aes192',
  'aes256',
  'camellia128',
  'camellia192',
  'camellia256',
  'aes128hmacsha1',
  'aes256hmacsha1',
  'blowfish'
]
