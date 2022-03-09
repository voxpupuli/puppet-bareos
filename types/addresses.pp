# @summary Bareos
#
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatype-addresses
#
type Bareos::Addresses = Hash[
  Optional[
    Hash[
      Enum['ip'],
      Struct[
        addr => Stdlib::Host,
        port => Stdlib::Port,
      ],
    ]
  ],
  Optional[
    Hash[
      Enum['ip4'],
      Struct[
        addr => Variant[Stdlib::Fdqn, Stdlib::IP::Address::V4],
        port => Stdlib::Port,
      ],
    ]
  ],
  Optional[
    Hash[
      Enum['ip6'],
      Struct[
        addr => Variant[Stdlib::Fdqn, Stdlib::IP::Address::V6],
        port => Stdlib::Port,
      ],
    ]
  ],
]
