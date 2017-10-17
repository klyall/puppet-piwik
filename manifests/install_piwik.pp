class piwik::install_piwik ($path, $user, $version, $download_baseurl) {

  ensure_packages( ['rsync', 'wget', 'unzip'], {'ensure' => 'present'} )

  if $version == 'latest' {
    $real_version = 'latest.tar.gz'
  } else {
    $real_version = "piwik-${version}.tar.gz"
  }

  file { $path:
    ensure => 'directory',
    owner  => $user,
    group  => $user,
  }

  archive { $real_version:
    ensure          => present,
    extract         => true,
    path            => "/tmp/${real_version}",
    extract_path    => "${path}",
    extract_command => 'tar xfz %s --strip-components=1',
    source          => "${download_baseurl}/${real_version}",
    creates         => "${path}/index.php",
    cleanup         => true,
    user            => $user,
    group           => $user,
  }

}
