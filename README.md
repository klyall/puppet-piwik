# Piwik

A puppet module to easily deploy Piwik.

This is an opinionated module that will by default install Apache, PHP and Piwik in the root of the web server.

## Usage

The simplest installation can be achieved with the following:

    class { 'piwik': }


The installation can be tailored by specifying any of the parameters in the class definition. Here is an example with the default values:

    class { 'piwik':
      version    => 'latest',
      path       => "/var/www/html",
      user        => "apache",
     }

Note: If you use a different, make sure the user has been created first.

*Please note:* After the first installation you have to initialize
 piwik by bootstrapping the database. For this use the setup gui in
 your browser according to the piwik installation manual.

## Plugins

You can install plugins like this:

    piwik::plugins:
      LoginFailLog:
        plugin_version: "latest"
      Barometer:
        plugin_version: "0.6.0"


## Contribute

Want to help - send a pull request.
