# == Class: piwik
#
# === Parameters
#
# [path] The path were piwik should be installed to (default: /srv/piwik)
# [user] The piwik user (default: www-data)
#
# === Examples
#
#  class { 'piwik':
#    path    => '/srv/piwik',
#    user    => 'www-data',
#    version => '2.9.0'
#  }
#
# === Authors
#
# Arthur Leonard Andersen <leoc.git@gmail.com>
#
# === Copyright
#
# See LICENSE file, Arthur Leonard Andersen (c) 2013
#
# Class:: piwik
#
class piwik (
  $path                        = $::piwik::params::path,
  $user                        = $::piwik::params::user,
  $version                     = $::piwik::params::version,
  $download_baseurl            = $::piwik::params::download_baseurl,
  $piwik_db_host               = $::piwik::params::piwik_db_host,
  $piwik_db_username           = $::piwik::params::piwik_db_username,
  $piwik_db_password           = $::piwik::params::piwik_db_password,
  $piwik_db_dbname             = $::piwik::params::piwik_db_dbname,
  $piwik_db_port               = $::piwik::params::piwik_db_port,
  $piwik_rec_mail_addr         = $::piwik::params::piwik_rec_mail_addr,
  $piwik_noreply_mail_addr     = $::piwik::params::piwik_noreply_mail_addr,
  $piwik_tracker_cookie_expire = $::piwik::params::piwik_tracker_cookie_expire,
  $piwik_mail_host             = $::piwik::params::piwik_mail_host,
  $piwik_trusted_hosts         = $::piwik::params::piwik_trusted_hosts,
  $piwik_plugins               = $::piwik::params::piwik_plugins,

) inherits ::piwik::params {

  class { '::piwik::install_piwik':
    path             => $path,
    user             => $user,
    version          => $version,
    download_baseurl => $download_baseurl,
  }

  class { '::piwik::config':
    path                        => $path,
    piwik_db_host               => $piwik_db_host,
    piwik_db_username           => $piwik_db_username,
    piwik_db_password           => $piwik_db_password,
    piwik_db_dbname             => $piwik_db_dbname,
    piwik_db_port               => $piwik_db_port,
    piwik_rec_mail_addr         => $piwik_rec_mail_addr,
    piwik_noreply_mail_addr     => $piwik_noreply_mail_addr,
    piwik_tracker_cookie_expire => $piwik_tracker_cookie_expire,
    piwik_mail_host             => $piwik_mail_host,
    piwik_trusted_hosts         => $piwik_trusted_hosts,
    piwik_plugins               => $piwik_plugins,
    user                        => $user,
  }

  if $piwik_plugins {
    create_resources(piwik::plugin, $piwik_plugins)
  }

}
