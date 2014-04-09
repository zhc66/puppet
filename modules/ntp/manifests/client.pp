class ntp::client {
  $ntp_servers = hiera('ntp_servers')
  #$ntpserver = hiera('cis::ntpserver',[ '0.pool.ntp.org', '1.pool.ntp.org',
  #    '2.pool.ntp.org', '3.pool.ntp.org' ])
  #package {'ntp':
  #  ensure => installed,
  #  notify => Exec['ntpdate-update'],
  #}
  #exec {'ntpdate-update':
  #  command     => '/usr/sbin/ntpdate -u 0.pool.ntp.org',
  #  refreshonly => true,
  #  require     => Package['ntp'],
  #}
  #file {'/etc/ntp.conf':
  #  content => template('cis/el6/etc/ntp.conf.erb'),
  #  owner   => root,
  #  group   => root,
  #  mode    => '0640',
  #  notify  => Package['ntp'],
  #}
  #file {'/etc/sysconfig/ntpd':
  #  source  => 'puppet:///modules/cis/el6/etc/sysconfig/ntpd',
  #  owner   => root,
  #  group   => root,
  #  mode    => '0640',
  #  notify  => Package['ntp'],
  #}

}
