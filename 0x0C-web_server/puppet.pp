
exec { 'echo':
  path    => '/usr/bin/',
  command => "echo 'hello\nworld' > word.txt"
}
