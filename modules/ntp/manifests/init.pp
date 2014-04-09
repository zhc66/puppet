include ntp

class ntp {

# To determine the service name based on OS type
    case $operatingsystem {
        CentOS, redhat: {
                $service_name = 'ntpd'
                $conf_file = 'ntp.pools.el6'
                       }
        debian, ubuntu:{
                $service_name = 'ntp'
                $conf_file = 'ntp.pools.debian'
                       }
                }

        package {"ntp":
                ensure => "installed",
                }

        $pools = [
                '2.au.pool.ntp.org',
                '3.au.pool.ntp.org',
                '4.au.pool.ntp.org'
                ]

        file {"ntp.conf":
                path => "/etc/ntp.conf",
                ensure => file,
                require => Package ["ntp"],
                content => template ('ntp/ntp.conf.erb'),
                }

        service {"ntp":
                name    => $service_name,
                ensure  => running ,
                enable  => true,
                #subscribe => File ["ntp.conf"],
                }
}

