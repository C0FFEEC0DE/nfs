# == Class: class_name
#
class nfs::client::packages {
  # resources
  package { 'nfs-common': ensure => installed } #rpcbind
}
