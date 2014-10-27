################################################################################
##
## Alces HPC Software Stack - Puppet configuration files
## Copyright (c) 2008-2013 Alces Software Ltd
##
################################################################################
filebucket { main: server => puppet }
Package { allow_virtual => true }
File { backup => main }
Exec { path => "/usr/bin:/usr/sbin/:/bin:/sbin" }
node default {
  class { 'alcesbase::profile::generic':
    role=>'slave',
  }
}
node /service(\d)*/ {
  class { 'alcesbase::profile::service':
    role=>$::alces_role,
  }
}
node /headnode*/ {
  class { 'alcesbase::profile::headnode':
    role=>$::alces_role,
  }
}
node /node(\d)*/ {
  class { 'alcesbase::profile::compute':
    role=>'slave',
  }
}
node /login(\d)*/ {
  class { 'alcesbase::profile::login':
    role=>'slave',
  }
}
node /oss(\d)*/ {
  class { 'alcesbase::profile::storage':
    role=>'slave',
  }
}
