class packetbeat::params(
  $host          = 'localhost',
  $port          = '9200',
  $interfaces    = 'any',
  $disable_procs = 'true',
  $agentname     = $::fqdn,
  $packetbeat    = 'packetbeat',
  $uid           = '450',
  $gid           = '450',
  $ensure        = 'running',
  $enable        = 'true',
  $version       = 'latest',
){

}

