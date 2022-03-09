# @summary Bareos
#
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatype-compression_algorithm
#
type Bareos::CompressionAlgorithm = Variant[
  Pattern[/GZIP[1-9]/],
  Enum[
    'LZO',
    'LZFAST',
    'LZ4',
    'LZ4HC',
  ]
]
