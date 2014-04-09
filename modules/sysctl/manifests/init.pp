class sysctl {
  exec { 'sysctl-reload':
    command     => '/sbin/sysctl -p /etc/sysctl.conf',
    refreshonly => true,
  }
}
