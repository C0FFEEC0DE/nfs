# nfs [![Build Status](https://travis-ci.org/l3dzzz/nfs.svg?branch=master)](https://travis-ci.org/l3dzzz/nfs)
## Description

Usage examples:
```ruby
node 'client1.example.net' {
  nfs::export {'vol1':
    path    => '/vol1',
    acl     => '192.168.50.0/24',
    options => 'rw,sync,no_root_squash',
  }
}

node 'client2.example.net' {
  nfs::mount{'/vol1':
    ensure     => present,
    share      => '/vol1',
    server     => '192.168.50.4',
    mountpoint => '/vol1',
  }
}
```

Run serverspec tests:
```ruby
vagrant provision client1 - for host client1
vagrant provision client2 - for host client2
```
## Requirements

```ruby
Vagrant
Vagrant plugin run: vagrant plugin install vagrant-serverspec
rvm
bundler
```

## Platform

Ubuntu 14.04.2 LTS

## Admin Information

## Reference
