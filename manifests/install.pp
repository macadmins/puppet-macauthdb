# Class to install required Ruby Gems for macauthdb
class macauthdb::install inherits macauthdb {

  validate_bool ($install_gems)

  if $install_gems == true {
    if $sqlite_manage {
      package { $sqlite_pkgname:
        ensure   => $sqlite_version,
        provider => 'puppet_gem',
      }
    }

  }
}

