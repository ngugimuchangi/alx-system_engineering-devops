# Create a file in /tmp

file {'school':
path    => '/tmp/school',
mode    => '0744',
owner   => 'www-data',
group   => 'wwd-data',
content => 'I love Puppet'
}
