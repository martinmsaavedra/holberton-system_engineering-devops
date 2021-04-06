#  Install Nginx web serve
package { 'nginx':
  ensure   => present,
  name     => 'nginx',
}

file { 'index.html':
  ensure  => present,
  path    => '/etc/nginx/html/index.html',
  content => 'Holberton School',
}

file_line { 'setup':
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  after  => '[::80]:80 default_server;'
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}

service {'nginx':
  ensure  => running,
  require => Package['nginx'],
}
