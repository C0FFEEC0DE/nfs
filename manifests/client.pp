# == Class: class_name
#
class nfs::client {
  # resources
  include nfs::client::packages
  include nfs::client::configure
}
