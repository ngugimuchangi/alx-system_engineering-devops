# Puppet manifest to install nginx and add custom header

exec { 'update':
  command  => 'sudo apt -y update',
  provider => 'shell'
}

exec { 'nginx':
  command  => 'sudo apt-get -y install nginx',
  provider => 'shell'
}

exec { 'config':
  command  => 'sudo sed -i s@"http {"@"http {\n\tadd_header X-Served-By \$HOSTNAME;"@g /etc/nginx/nginx.conf',
  provider => 'shell',
  notify   => Exec['restart']
}

exec { 'restart':
  command  => 'sudo service nginx restart',
  provider => 'shell'
}
