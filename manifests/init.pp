# == Class: managedmac
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
#  include managedmac
#
#  class { managedmac: }
#
# === Authors
#
# 
#
# === Copyright
#
# Copyright 2015 Simon Fraser University, unless otherwise noted.
#Brian Warsing <bcw@sfu.ca>
class macauthdb {
  unless $::operatingsystem  ==  'Darwin' {
    fail("unsupported osfamily: ${::osfamily}")
  }

  $min_os_version = '10.9'

  if versioncmp($::macosx_productversion_major, $min_os_version) < 0 {
    fail("unsupported product version: ${::macosx_productversion_major}")
  }

  include macauthdb::params
  class { 'macauthdb::install': } ~>
  class { 'macauthdb::authorization': }

  contain 'macauthdb::install'
  contain 'macauthdb::authorization'
}
