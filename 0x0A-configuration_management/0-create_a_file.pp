# Scripts that make a file in /temp

file { 'new_file':
  ensure  => 'present',
  path    => '/tmp/holberton',
  owner   => 'www-data',
  content => 'I love Puppet',
  group   => 'www-data',
  mode    => '0744',
}
