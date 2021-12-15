# @summary Bareos Resource data type
type Bareos::Resource = Pattern[/^[a-z][a-z0-9\.\-_ \$]{0,126}$/]
