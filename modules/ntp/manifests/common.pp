class ntp::common {
  package {'ntp': ensure => present}
  service {'ntpd': ensure => running, enable => true, require => Package['ntp']}
  
}
