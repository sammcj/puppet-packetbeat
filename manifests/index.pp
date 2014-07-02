class packetbeat::index( ) {

  file { '/etc/packetbeat/packetbeat.template.json':
    ensure  => present,
    owner   => 'packetbeat',
    group   => 'packetbeat',
    mode    => '0755',
    source  => 'puppet:///modules/packetbeat/packetbeat.template.json',
    require => File['/etc/packetbeat/'],
  }

  exec { 'install-es-template':
    command => "curl -f -XPUT 'http://${packetbeat::host}:9200/_template/packetbeat' -d@packetbeat.template.json ",
    cwd     => '/etc/packetbeat',
    #unless  => 'curl -XGET 'http://${packetbeat::host}:9200/_template/packetbeat?pretty', # TODO grep for correct output here
    require => File['/etc/packetbeat/packetbeat.template.json'],
  }

}