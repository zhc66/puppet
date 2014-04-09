include users-admin

class users-admin {"users-admin":

        user {"ntp.conf":
                path => "/etc/ntp.conf",
                ensure => file,
                require => Package ["ntp"],
                content => template ('ntp/ntp.conf.erb'),
                }

