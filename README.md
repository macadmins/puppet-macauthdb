# Purpose
This module includes puppet types and providers to manage the OS X  authorization database(/var/db/auth.db)

```
class {'macauthdb:
    allow_energysaver            => true,
    allow_printers               => true,
    allow_timemachine            => true,
    allow_datetime               => true,
    allow_dvd_setregion_initial  => true
}
```

By default, this module will attempt to also install the `sqlite3` gem, which is required. If you're already managing that resource somewhere, set `install_gems` to false.

```
class {'macauthdb:
    install_gems    => false,
    allow_printers  => true
}
```


# Credit

This module was written by Brian Warsing(@dayglojesus) as part of the [managedmac](github.com/dayglojesus/managedmac) puppet module. 
