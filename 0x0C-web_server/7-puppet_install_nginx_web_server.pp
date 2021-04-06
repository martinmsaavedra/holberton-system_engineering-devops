#  Install Nginx web serve
exec { 'apt-get_update':
  command => 'apt-get update',
}

package { 'nginx':
  provider => 'apt-get',
  ensure   => 'installed',
}

file { 'index.html':
  ensure  => 'present',
  path    => '/etc/nginx/html',
  content => 'Holberton School',
}

file { '404.html':
  ensure  => 'present',
  path    => '/etc/nginx/html',
  content => 'Ceci n\'est pas une page',
}

service {'nginx':
  ensure  => running,
  require => Package['nginx'],
}
