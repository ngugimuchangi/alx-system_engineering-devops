# Puppet manifest to install nginx and add custom header

exec { 'update':
  command  => 'sudo apt-get -y update',
  provider => 'shell'
}

exec { 'nginx':
  command  => 'sudo apt-get -y install nginx',
  provider => 'shell'
}

exec { 'config':
  command  => 'sudo sed "13i\\\tadd-header X-Served-By $hostname;" /etc/nginx/nginx.conf && sudo service nginx restart',
  provider => 'shell'
}
