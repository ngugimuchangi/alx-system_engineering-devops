# Puppet manifest to configure nginx server

$index = '/usr/share/nginx/html'
$debian_index = '/var/www/html/index.nginx-debian.html'
$default_config = '/etc/nginx/sites-available/default'
$command_path = ['/usr/bin/', '/usr/sbin', '/bin']

exec { 'update_package_repo':
  provider => 'shell',
  path     => $command_path,
  command  => 'sudo apt -y update',
  before   => Exec['install_nginx']
}

exec { 'install_nginx':
  provider => 'shell',
  path     => $command_path,
  command  => 'sudo apt -y install nginx'
}

exec { 'nginx_restart':
  provider => 'shell',
  path     => $command_path,
  command  => 'sudo service nginx restart'
}

exec { 'home_page':
  provider => 'shell',
  path     => $command_path,
  command  => ['sudo echo "Hello World!" > $index', 'sudo echo "Hello World!" > $debian_index']
}

exec { 'redirection':
  $pattern = 'server_name _;'
  $replacement = 'server_name _;\
	rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;'
  provider => 'shell',
  path     => $command_path,
  command  => '/usr/bin/sed -i "s@$pattern@$replacement@g" $default_config',
  notify   => Exec['nginx_restart']
}
