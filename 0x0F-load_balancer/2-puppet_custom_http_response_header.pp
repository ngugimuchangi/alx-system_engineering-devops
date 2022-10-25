# Puppet manifest to install nginx and add custom header

exec { 'update':
  provider => 'shell',
  command  => ['sudo apt -y update', 'sudo apt -y upgrade'],
  path     => '/usr/bin'
}

exec { 'nginx':
  provider => 'shell',
  command  => 'sudo apt -y install nginx',
  path     => '/usr/bin'
}

exec { 'config':
  provider => 'shell',
  command  => 'sudo sed 13i\\\\t"add-header X-Served-By $hostname" /etc/nginx/nginx.conf',
  path     => '/usr/bin'
}
