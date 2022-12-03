# Manifest to fix apache configuration
file { 'fix config file':
  command  =>  "sed -i 's/phpp/php/g' /var/www/html/wp-settings.php",
  provider => 'shell'
}
