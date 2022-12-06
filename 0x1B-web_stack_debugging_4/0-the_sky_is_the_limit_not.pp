# Manifest to fix Nginx open file limit configuration
exec { 'nginx fix':
  command => 'sed -i s/15/500/g /etc/default/nginx',
  path    =>  '/bin'
}

exec { 'nginx restart':
  command  => 'service nginx restart',
  provider => 'shell'
}
