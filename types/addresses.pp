# @summary The weird, weird Bareos director addresses format
# @author Tobias @towo Wolter <tobias.wolter+voxpupuli@b1-systems.de>
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatypenetaddresses
type Bareos::Addresses = Hash[
  Enum['ip', 'ipv4', 'ipv6'], Variant[
    Struct[
      {
        addr           => Stdlib::Host,
        Optional[port] => Stdlib::Port,
      }
    ],
    Array[
      Struct[
        {
          addr           => Stdlib::Host,
          Optional[port] => Stdlib::Port,
        }
      ]
    ]
  ]
]
