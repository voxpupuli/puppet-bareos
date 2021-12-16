# @summary Bareos Resource data type
type Bareos::Resource = Pattern[/(?i:^[a-z][a-z0-9\.\-_ \$]{0,126}$)/]
