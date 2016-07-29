# == Class: macauthdb
#
# Module initializer.
#
# This module only supports OS X 10.9 or greater.
#
# === Parameters
#
# None
#
# === Variables
#
# [*osfamily*]
#   The osfamily must be Darwin. If not, Puppet will fail.
#
# [*macosx_productversion_major*]
#   The macosx_productversion_major must be 10.9 or greate. If not, Puppet
#   will fail.
#
# === Examples
#
#  include macauthdb
#
#  class { macauthdb: }
#
# === Authors
#
# 
#
# === Copyright
#
# Copyright 2015 Simon Fraser University, unless otherwise noted.
#Brian Warsing <bcw@sfu.ca>
class macauthdb (
  $install_gems                 = $macauthdb::params::install_gems,
  $sqlite_manage                = $macauthdb::params::sqlite_manage,
  $sqlite_pkgname               = $macauthdb::params::sqlite_pkgname,
  $sqlite_version               = $macauthdb::params::sqlite_version,
  $allow_energysaver            = $macauthdb::params::allow_energysaver,
  $allow_datetime               = $macauthdb::params::allow_datetime,
  $allow_timemachine            = $macauthdb::params::allow_timemachine,
  $allow_printers               = $macauthdb::params::allow_printers,
  $allow_dvd_setregion_initial  = $macauthdb::params::allow_dvd_setregion_initial
) inherits macauthdb::params {

  unless $::operatingsystem  ==  'Darwin' {
    fail("unsupported osfamily: ${::osfamily}")
  }

  $min_os_version = '10.9'

  if versioncmp($::macosx_productversion_major, $min_os_version) < 0 {
    fail("unsupported product version: ${::macosx_productversion_major}")
  }

  class { 'macauthdb::install': } ~>
  class { 'macauthdb::authorization': }

  contain 'macauthdb::install'
  contain 'macauthdb::authorization'
}
