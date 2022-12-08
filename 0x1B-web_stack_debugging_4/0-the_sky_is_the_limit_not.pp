# Manifest to fix Nginx open file limit configuration
exec { 'nginx fix':
  command => "sed -i s/'-n 15'/'-n 4096'/g /etc/default/nginx",
  path    =>  '/bin'
}

exec { 'nginx restart':
  command  => 'service nginx restart',
  provider => 'shell'
}
