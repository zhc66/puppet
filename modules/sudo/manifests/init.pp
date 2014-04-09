class sudo {
  package {'sudo': ensure => present}
  file {'/etc/sudoers':
    owner   => root,
    group   => root,
    mode    => 0440,
    content => template('sudo/sudoers.erb'),
    require => Package['sudo'],
  }
}
