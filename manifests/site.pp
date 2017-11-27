## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.

contain nginx

$hello_html = lookup('message')

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
