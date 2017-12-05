# Parameters class for macauthdb
class macauthdb::params (
  $install_gems                 = true,
  $allow_energysaver            = false,
  $allow_datetime               = false,
  $allow_timemachine            = false,
  $allow_printers               = false,
  $allow_dvd_setregion_initial  = false
) {

  $sqlite_manage = $::osfamily ? {
    'Darwin' => true,
    default   => false,
  }

  $sqlite_pkgname = $::macosx_productversion_major ? {
    '10.11'   => 'sqlite3',
    default => 'sqlite3',
  }

  $sqlite_version = $::macosx_productversion_major ? {
    '10.11'   => '1.3.11',
    default => '1.3.11',
  }

}
