# Kill proccess called killmenow

exec { 'kill':
  command => '/usr/bin/pkill killmenow'
}
