# Puppet manifest to install nginx and add custom header

exec { 'update':
  command  => ['sudo apt -y update', '&& sudo apt -y upgrade'],
  provider => 'shell'
}

exec { 'nginx':
  command  => 'sudo apt-get -y install nginx',
  provider => 'shell'
}

exec { 'config':
  command  => 'sudo sed "13i\\\tadd_header X-Served-By $HOSTNAME;" /etc/nginx/nginx.conf',
  provider => 'shell',
  notify   => Exec['restart']
}

exec { 'restart':
  command  => 'sudo service nginx restart',
  provider => 'shell'
}
