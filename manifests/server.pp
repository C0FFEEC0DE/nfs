# == Class: class_name
#
class nfs::server {
  include nfs::server::packages
  include nfs::server::configure
  include nfs::server::service
#  nfs::server::packages -> nfs::server::configure  -> nfs::server::service
}
