# Manifest to fix apache configuration
file { 'index.html':
  ensure =>  present,
  path   => '/var/www/html/index.html'
}
