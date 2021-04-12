node 'haproxy-server' {
  include ::haproxy
  haproxy::listen { 'puppet00':
    collect_exported => false,
    ipaddress        => $::ipaddress,
    ports            => '80',
    balance          => 'roundrobin',
  }

}