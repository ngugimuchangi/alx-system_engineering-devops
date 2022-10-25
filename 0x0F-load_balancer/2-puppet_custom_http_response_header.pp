# Puppet manifest to install nginx and add custom header

exec { 'update':
  provider => 'shell',
  command  => 'sudo apt-get -y update',
}

exec { 'nginx':
  provider => 'shell',
  command  => 'sudo apt-get -y install nginx',
}

exec { 'config':
  provider => 'shell',
  command  => 'sudo sed "13i\\\tadd-header X-Served-By $hostname;" /etc/nginx/nginx.conf && sudo service nginx restart',
}
