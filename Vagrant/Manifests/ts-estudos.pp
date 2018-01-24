exec {"apt-update":
    command => "/usr/bin/apt-get update"
}

package {["nodejs"]:
    ensure => installed,
    require => Exec["apt-update"]
}

file { '/usr/bin/node':
  ensure => 'link',
  target => '/usr/bin/nodejs',
  require => Package["nodejs"]
}