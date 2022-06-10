# @summary Bareos
#
# @see https://docs.bareos.org/Configuration/CustomizingTheConfiguration.html#datatype-audit_command_list
#
type Bareos::AuditCommandList = Variant[
  Enum[
    'label',
    'restore',
  ],
  Array[
    Enum[
      'label',
      'restore',
    ]
  ],
]
