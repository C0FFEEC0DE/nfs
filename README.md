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
```ruby
node 'client1.example.net' {
  class { 'nfs::server::exports':
    share => {
      'vol1' => {
        path    => '/vol1',
        acl     => '192.168.50.0/24',
        options => 'rw,sync,no_root_squash'},
      'vol2' => {
        path    => '/vol2',
        acl     => '192.168.50.0/24',
        options => 'rw,sync,no_root_squash'},
      },
    }
}

node 'client2.example.net' {
  class { 'nfs::client::mounts':
    share => {
      'vol1' => {
        ensure     => present,
        share      => '/vol1',
        server     => '192.168.50.4',
        mountpoint => '/vol1'},
      'vol2' => {
        ensure     => present,
        share      => '/vol2',
        server     => '192.168.50.4',
        mountpoint => '/vol2'},
    },
  }
}
```
```yaml
---
classes:
  - nfs::server::exports
nfs::server::exports::share:
  vol1:
    path: '/vol1'
    acl: '192.168.50.0/24'
    options: 'rw,sync,no_root_squash'
  vol2:
    path: '/vol2'
    acl: '192.168.50.0/24'
    options: 'rw,sync,no_root_squash'
```

```yaml
---
classes:
  - nfs::client::mounts
nfs::client::mounts::share:
  vol1:
    ensure: 'present'
    share: '/vol1'
    server: '192.168.50.4'
    mountpoint: '/vol1'
  vol2:
    ensure: 'present'
    share: '/vol2'
    server: '192.168.50.4'
    mountpoint: '/vol2'
```

Run serverspec tests:
```txt
make stests - run all serverspec tests in both machine (client1, client2)
make atest: - run rspec and syntax tests
make clean - destroy both vm machine
```
## Requirements

```txt
Vagrant
Vagrant plugin install run: vagrant plugin install vagrant-serverspec
rvm
bundler
make
```

## Platform

Ubuntu 14.04.2 LTS

## Admin Information

## Reference
