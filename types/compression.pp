# @summary Bareos compression algorithms
# @author Tobias @towo Wolter <tobias.wolter+voxpupuli@b1-systems.de>
# @see https://docs.bareos.org/Configuration/Director.html?highlight=sha512#config-Dir_Fileset_Include_Options_Compression
type Bareos::Compression = Pattern[
  /(?i:GZIP)/,
  /(?i:GZIP1)/,
  /(?i:GZIP2)/,
  /(?i:GZIP3)/,
  /(?i:GZIP4)/,
  /(?i:GZIP5)/,
  /(?i:GZIP6)/,
  /(?i:GZIP7)/,
  /(?i:GZIP8)/,
  /(?i:GZIP9)/,
  /(?i:LZO)/,
  /(?i:LZFAST)/,
  /(?i:LZ4)/,
  /(?i:LZ4HC)/
]
