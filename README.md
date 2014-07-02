# Class: packetbeat

Module to deploy PacketBeat and manage configuration

## Parameters

```
host                    - elasticsearch host (localhost)
port                    - elasticsearch port (9200)
interfacesrfaces        - interfaces to listen on (all)
disable_procs           - processes to disable
agentnametname          - name of agent (fqdn)
user                    - user to run service as (packetbeat)
uid                     - user to run as (450)
gid                     - user to run as (450)
```

## Examples

```
class { packetbeat:
  host => 'elasticsearch.server.com'
}

packetbeat::procs { 'postgresql':
  procs   => 'postgres',
  cmdline => 'postgres',
}
```

## Uninstall

```
class { packetbeat:
  ensure => 'absent',
}
```

## Authors

Sam Mcleod <github.com/sammcj> (forked from Kris Buytaert <kris@inuits.eu>)

## Copyright

GPLv2

### TODO

- use packetbeat::params::user
- logging