# == Class: class_name
#
class nfs::server::service {
  # resources
  service { 'nfs-kernel-server':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package['nfs-kernel-server'],
  }
}
