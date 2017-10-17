define piwik::plugin (
  $plugin_name         = $title,
  $plugin_version      = "latest",
  $plugin_download_url = "https://plugins.piwik.org/api/2.0/plugins/${plugin_name}/download/${plugin_version}",
  $path                = $piwik::path,
  $user                = $piwik::user,
){

  archive { $plugin_name:
    ensure        => present,
    extract       => true,
    path          => "/tmp/${plugin_name}.zip",
    extract_path  => "${path}/plugins/",
    source        => $plugin_download_url,
    creates       => "${path}/plugins/${plugin_name}",
    cleanup       => true,
    user          => $user,
    group         => $user,
  }

  require piwik::install_piwik

}
