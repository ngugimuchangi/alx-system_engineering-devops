# Manifest to change ssh login configuration

exec { 'ssh_login':
  command => 'echo "PasswordAuthentication no\nIdentityFile ~/.ssh/holberton" >> /etc/ssh/ssh_config',
  path    => '/bin/'
}
