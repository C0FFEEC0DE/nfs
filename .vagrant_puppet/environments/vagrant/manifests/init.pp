#include nfs
#hiera_include('classes')


node 'client1.example.net' {
  nfs::export {'vol1':
    path    => '/vol1',
    acl     => '192.168.50.0/24',
    options => 'rw,sync,no_root_squash',
  }
  nfs::export {'vol2':
    path    => '/vol2',
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
  nfs::mount{'/vol2':
    ensure     => present,
    share      => '/vol2',
    server     => '192.168.50.4',
    mountpoint => '/vol2',
  }
}
