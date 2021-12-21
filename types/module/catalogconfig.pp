# @summary Bareos module catalog config
# @author Tobias @towo Wolter <towo+voxpupuli@b1-systems.de>
type Bareos::Module::CatalogConfig = Struct[{
    Optional['db_address']  => String,
    'db_driver'             => Enum[
      'sqlite3',
      'mysql',
      'postgresql'
    ],
    'db_name'               => String,
    Optional['db_password'] => String,
    Optional['db_port']     => Stdlib::Port,
    Optional['db_socket']   => String,
    Optional['db_user']     => String,
}]
