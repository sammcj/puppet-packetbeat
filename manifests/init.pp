# == Class: packetbeat
#
# Module to deploy PacketBeat and manage configuration
#
# === Parameters
#
# host                    - elasticsearch host (localhost)
# port                    - elasticsearch port (9200)
# interfacesrfaces        - interfaces to listen on (all)
# disable_procs           - processes to disable
# agentnametname          - name of agent (fqdn)
# user                    - user to run service as (packetbeat)
# uid                     - user to run as (450)
# gid                     - user to run as (450)
#
# === Variables
#
# === Examples
#
# class { packetbeat:
#   host => 'elasticsearch.server.com'
# }
# packetbeat::procs { 'pgsql':
#   procs   => 'pgsql',
#   cmdline => 'postgres',
# }
#
# packetbeat::procs { 'nginx':
#   procs   => 'nginx',
#   cmdline => 'nginx',
# }
#
# === Uninstall
#
# class { packetbeat:
#   ensure => 'absent',
# }
#
# === Authors
#
# Sam Mcleod <github.com/sammcj> (forked from Kris Buytaert <kris@inuits.eu>)
#
# === Copyright
#
# GPLv2
#
# === TODO
#
# - use packetbeat::params::user
# - logging

class packetbeat (
  $host           = $packetbeat::params::host,
  $port           = $packetbeat::params::port,
  $interfaces     = $packetbeat::params::interfaces,
  $disable_procs  = $packetbeat::params::disable_procs,
  $agentname      = $packetbeat::params::agentname,
  $gid            = $packetbeat::params::user,
  $uid            = $packetbeat::params::uid,
  $gid            = $packetbeat::params::gid,
  $ensure         = 'present',
) inherits packetbeat::params {

  case $ensure {
    'absent': {
      package { 'packetbeat':
        ensure => purged,
      }

      file { ['/etc/packetbeat','/etc/packetbeat/packetbeat.template.json']:
        ensure => absent,
        force  => true,
      }
    }
    default: {
      include packetbeat::package
      include packetbeat::config
      include packetbeat::service
      include packetbeat::index
    }
  }

}
