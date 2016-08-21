# == Class: class_name
#
class nfs::server::exports (
  $share = {}
    ){

  create_resources('nfs::export', $share)
}
