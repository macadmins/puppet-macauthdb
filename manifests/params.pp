#
class macauthdb::params {

  $sqlite_manage = $::osfamily ? {
    'Darwin' => true,
    default   => false,
  }

  $cfpropertylist_manage = $::osfamily ? {
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
