# == Class: class_name
#
class nfs::server::packages {
  # resources
  package { 'nfs-kernel-server': ensure => installed }
}
