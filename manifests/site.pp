## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.

contain nginx

$hello_html = @("HELLO"/L)
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang xml:lang>
<head>
<meta charset="utf-8" />
<meta name="generator" content="pandoc" />
<title>Hello, World!</title>
<style type="text/css">
code{white-space: pre-wrap;}
.smallcaps{font-variant: small-caps;}
.line-block{white-space: pre-line;}
.column{display: inline-block;}
</style>
</head>
<body>
<p>Hello, World!</p>
</body>
</html>
  | HELLO

file { '/usr/local/www/hello-world':
  ensure => directory,
}

-> file { '/usr/local/www/hello-world/index.html':
  ensure  => file,
  content => $hello_html,
}

nginx::resource::server { 'hello-world':
  www_root => '/usr/local/www/hello-world',
}
