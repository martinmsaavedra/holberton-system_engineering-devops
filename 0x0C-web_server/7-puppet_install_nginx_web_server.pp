#  Install Nginx web serve
exec { 'apt-get_update':
  command => 'apt-get update -y',
}

package { 'nginx':
  provider => 'apt-get',
  ensure   => 'present',
  name     => 'nginx',
}

file { 'index.html':
  ensure  => 'present',
  path    => '/etc/nginx/html/index.html',
  content => 'Holberton School\n',
}

file_line { 'setup':
  path   => '/etc/nginx/sites-available/default',
  ensure => 'present',
  after  => '[::80]:80 default_server;'
  line   => 'rewrite ^/redirect_me/$ https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent';,


service {'nginx':
  ensure  => running,
  require => Package['nginx'],
}
