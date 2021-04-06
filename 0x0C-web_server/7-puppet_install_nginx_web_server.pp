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

file {'default':
    path     => '/etc/nginx/sites-available/default',
    content  => 'listen 80;
    listen [::]:80 default_server;
    root   /etc/nginx/html;
    index  index.html index.htm;
    redirect ^/redirect_me/$ https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;
    error_page 404 /404.html;
    location /404 {
      root /etc/nginx/html;
      internal;
    }',
    ensure  => 'present',    
}

service {'nginx':
  ensure  => running,
  require => Package['nginx'],
}
