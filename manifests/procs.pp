define packetbeat::procs($procs,$cmdline)
{
  concat::fragment {"procs-${procs}":
    target  => '/etc/packetbeat/packetbeat.conf',
    content => template('packetbeat/procs.conf.erb'),
    order   => 40,
    require => File['/etc/packetbeat/'],
  }
}



