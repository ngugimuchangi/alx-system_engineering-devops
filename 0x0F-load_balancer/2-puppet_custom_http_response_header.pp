# Puppet manifest to install nginx and add custom header

exec { 'update':
  command  => 'sudo apt -y update',
  provider => 'shell',
  before   => Exec['nginx'],
}

exec { 'nginx':
  command  => 'sudo apt -y install nginx',
  provider => 'shell',
  before   => Exec['config'],
}

exec { 'config':
  command  => 'sudo sed -i s@"http {"@"http {\n\tadd_header X-Served-By \$HOSTNAME;"@g /etc/nginx/nginx.conf',
  provider => 'shell',
  before   => Exec['restart'],
}

exec { 'restart':
  command  => 'sudo service nginx restart',
  provider => 'shell',
}
