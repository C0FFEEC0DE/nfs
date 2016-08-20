# Export a specific file share via NFS
define nfs::export($path,$acl,$options='') {
  include nfs::server

  file { $path:
    ensure => directory,
  }

  file { "/etc/exports.d/${name}":
    content => "${path} ${acl}(${options})\n",
    notify  => Exec['update-etc-exports'],
  }
}
