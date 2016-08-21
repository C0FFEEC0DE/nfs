# == Class: class_name
#
class nfs::client::mounts (
  $share = {}
    ) {

  create_resources('nfs::mount', $share)
}
