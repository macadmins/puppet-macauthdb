#
class macauthdb::install (
  $sqlite_manage = $macauthdb::params::sqlite_manage,
  $cfpropertylist_manage = $macauthdb::params::cfpropertylist_manage,
  $sqlite_pkgname = $macauthdb::params::sqlite_pkgname,
  $sqlite_version = $macauthdb::params::sqlite_version,
) inherits macauthdb {

  if $sqlite_manage {
    package { $sqlite_pkgname:
      ensure   => $sqlite_version,
      provider => 'puppet_gem',
    }
  }

  if $cfpropertylist_manage {
    package { 'CFPropertyList':
      ensure   => '2.3.2',
      provider => 'puppet_gem',
    }
  }

}

