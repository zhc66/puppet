class soe {
  include cis::el6

  Firewall {
    before  => Class['fw::post'],
    require => Class['fw::pre'],
  }
  class { 'firewall': }
  class { ['fw::pre', 'fw::post']: }
  
  # Empty class atm
  #require hardening::el6
  package {[
    'wget',
    'unzip',
    'openssh-clients',
    'perl',
  ]: ensure => present }

  sysctl::entry {[
    'net.bridge.bridge-nf-call-ip6tables',
    'net.bridge.bridge-nf-call-iptables',
    'net.bridge.bridge-nf-call-arptables',
  ]:
    ensure => absent,
  }

#  case $environment {
#   'dev':  { include environments::dev  }
#   'prod': { include environments::prod }
#  } 

  include sudo
  if ! $server_type == 'ntp_server' {
    require ntp::client
  }

}
