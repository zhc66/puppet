define sysctl::entry (
  $value   = undef,
  $ensure  = undef,
) {
  include sysctl

  if ($ensure != 'absent') {
    augeas {"/files/etc/sysctl.conf/${title}":
      context => '/files/etc/sysctl.conf',
      changes => [
        "set ${title} ${value}",
      ],
      notify  => Exec['sysctl-reload'],
    }
    # We also need to check if this value is currently set in case someone has set it manually with the sysctl command
    exec {"check_sysctl_${title}":
      path    => '/sbin:/bin',
      command => "/sbin/sysctl -w ${title}=\"${value}\"",
      unless  => "sysctl -q ${title} | cut -d '=' -f 2 | awk '{print \$1}' | grep -q '^${value}$'",
    }
  }
  else {
    augeas {"/files/etc/sysctl.conf/${title}":
      context => '/files/etc/sysctl.conf',
      changes => [
        "rm ${title}",
      ],
      notify  => Exec['sysctl-reload'],
    }
  }


}
