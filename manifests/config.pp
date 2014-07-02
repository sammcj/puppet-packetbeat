class packetbeat::config() inherits packetbeat {

  group { 'packetbeat':
    ensure  => present,
    gid     => '450',
  }

  user { 'packetbeat':
    comment => 'packetbeat service',
    home    => '/etc/packetbeat',
    ensure  => present,
    shell   => '/sbin/nologin',
    uid     => '450',
    gid     => '450',
    require => Group['packetbeat'],
  }

  file { '/etc/packetbeat/':
    ensure  => 'directory',
    owner   => 'packetbeat',
    group   => 'packetbeat',
    mode    => '0755',
    require => User['packetbeat'],
  }

  concat { '/etc/packetbeat/packetbeat.conf':
    owner   => 'packetbeat',
    group   => 'packetbeat',
    mode    => '0755',
    notify  => Service['packetbeat'],
    require => File['/etc/packetbeat/'],
  }

  concat::fragment {'head':
    target  => '/etc/packetbeat/packetbeat.conf',
    content => template('packetbeat/packetbeat.conf.erb'),
    order   => 0,
    require => File['/etc/packetbeat/'],
  }

}

