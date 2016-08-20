# == Class: class_name
#
class nfs::server::configure {
  file { '/etc/exports.d':
    ensure => directory,
  }

  exec { 'update-etc-exports':
    command     => '/bin/cat /etc/exports.d/* >/etc/exports',
    notify      => Service['nfs-kernel-server'],
    refreshonly => true,
  }
}
