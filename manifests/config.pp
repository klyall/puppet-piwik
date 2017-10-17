class piwik::config (
  $path,
  $piwik_db_host,
  $piwik_db_username,
  $piwik_db_password,
  $piwik_db_dbname,
  $piwik_db_port,
  $piwik_rec_mail_addr,
  $piwik_noreply_mail_addr,
  $piwik_tracker_cookie_expire,
  $piwik_mail_host,
  $piwik_trusted_hosts,
  $piwik_plugins,
  $user,
) {

  file { "$path/config/config.ini.php":
    ensure  => present,
    require => Class['::piwik::install_piwik'],
    content => template('piwik/config.ini.php.erb'),
    owner   => $user,
    group   => $user,
  }
}
