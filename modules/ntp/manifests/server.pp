class ntp::server {
  include ntp::common
  
  #XXX 
  $ntp_servers = [ '0.pool.ntp.org', '1.pool.ntp.org', '2.pool.ntp.org', '3.pool.ntp.org' ]
  #XXX move to hiera
  #$ntp_access = {
  #  '10.0.212.0' => '255.255.255.0',
  #  '10.11.0.0'  => '255.255.252.0',
  #}
  $ntp_access = hiera('ntp::server::access')
  file {'/etc/sysconfig/ntpd':
    content => 'OPTIONS="-u ntp:ntp -p /var/run/ntpd.pid -g"',
    owner   => root,
    group   => root,
    mode    => '0640',
    notify  => Service['ntpd'],
  }

  file {'/etc/ntp.conf':
    content => template('ntp/server-ntp.conf.erb'),
    owner   => root,
    group   => root,
    mode    => '0600',
    notify => Service['ntpd'],
  }
  #XXX firewall open udp 123 to appropriate network
}
