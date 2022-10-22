# Puppet manifest to configure nginx server

$command_path = ['/usr/bin/', '/usr/sbin', '/bin']

exec { 'update_package_repo':
  provider => 'shell',
  path     => $command_path,
  command  => 'sudo apt -y update',
}

exec { 'install_nginx':
  provider => 'shell',
  path     => $command_path,
  command  => 'sudo apt -y install nginx'
}

exec { 'home_page':
  provider => 'shell',
  path     => $command_path,
  command  => 'sudo echo "Hello World!" | sudo tee /var/www/html/index.nginx-debian.html'
}

exec { 'redirection':
  provider => 'shell',
  path     => $command_path,
  command  => 'sudo sed -i "s@server_name _;@server_name _;\n\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;@g" /etc/nginx/sites-available/default'
}

exec { 'nginx_start':
  provider => 'shell',
  path     => $command_path,
  command  => 'sudo service nginx start'
}
