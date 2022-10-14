file {'school':
ensure  => 'present',
path    => '/tmp/school',
mode    => '0744',
owner   => 'www-data',
group   => 'wwd-data',
content => 'I love Puppet'
}
