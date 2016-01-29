# Purpose
This module includes puppet types and providers to manage the OS X  authorization database(/var/db/auth.db)

# Example:

    ```
    # Allow everyone to modify Energy Saver settings in the System Prefernces control panel

    # First change the parent class
    macauthdb { 'system.preferences':
      ensure            => 'present',
      allow_root        => 'true',
      auth_class        => 'user',
      auth_type         => 'right',
      authenticate_user => 'true',
      comment           => 'Checked by the Admin framework when making changes to certain System Preferences.',
      group             => 'everyone',
      session_owner     => 'false',
      shared            => 'true',
      timeout           => '2147483647',
      tries             => '10000',
    }

    # Then change the target
    macauthdb { 'system.preferences.energysaver':
      ensure            => 'present',
      allow_root        => 'true',
      auth_class        => 'user',
      auth_type         => 'right',
      authenticate_user => 'true',
      comment           => 'Checked by the Admin framework when making changes to the Energy Saver preference pane.',
      group             => 'everyone',
      session_owner     => 'false',
      shared            => 'true',
      timeout           => '2147483647',
      tries             => '10000',
    }
    ```

The `macauthdb::authorization` class includes support for easily managing several settings:

```
class {'macauthdb::authorization':
    allow_energysaver            => true,
    allow_printers               => true,
    allow_timemachine            => true,
    allow_datetime               => true,
    allow_dvd_setregion_initial  => true,
}
```


# Credit
This module was written by Brian Warsing(@dayglojesus) as part of the [managedmac](github.com/dayglojesus/managedmac) puppet module. 
The only changes that have been made so far were fixes to make the module work with Puppet 4. 
