# == Define: define_namount
define nfs::mount (
  $share,
  $server,
  $mountpoint,
  $ensure=present,
  $client_options='auto'
  ) {

  include nfs::client

  $real_mountpoint = $mountpoint?{
    ''      => $name,
    default => $mountpoint
  }

case $ensure {
  present: {
    exec {"create ${real_mountpoint} and parents":
      path    => '/bin:/usr/bin:/usr/local/bin',
      command => "mkdir -p ${real_mountpoint}",
      unless  => "test -d ${real_mountpoint}",
    }

    mount { $share:
      ensure  => mounted,
      device  => "${server}:/${share}",
      require => [Exec["create ${real_mountpoint} and parents"]],
      fstype  => 'nfs',
      options => $client_options
    }

  }

  absent: {
    mount { $share:
      ensure => unmounted,
    }
  }

  default: { }
  }
}
