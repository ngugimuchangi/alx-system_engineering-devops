# Puppet manifest to configure nginx server

$index = '/usr/share/nginx/html'
$debian_index = '/var/www/html/index.nginx-debian.html'
$default_config = '/etc/nginx/sites-available/default'

exec { 'update_package_repo':
  command => ['/usr/bin/apt -y update', '/usr/bin/apt -y upgrade']
}

package { 'nginx':
  ensure   => 'installed',
  provider => 'apt',
  require  => Exec['update_package_repo']
}

service { 'nginx_restart':
  ensure => 'running',
  enable => 'true'
}

exec { 'home_page':
  command => ['echo "Hello World!" > $index', 'echo "Hello World" > $debian_index']
}

exec { 'redirection':
  $pattern = 'server_name _;'
  $replacement = 'server_name _;\
	rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;'
  command => '/usr/bin/sed -i "s@$pattern@$replacement@g" $default_config'
  notify  => Service['nginx_restart']
}
