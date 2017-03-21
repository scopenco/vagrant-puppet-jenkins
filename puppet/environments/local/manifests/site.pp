# site.pp

class { 'epel': } ->

yumrepo {'jenkins':
  descr    => 'Jenkins',
  baseurl  => 'http://pkg.jenkins-ci.org/redhat/',
  gpgcheck => 1,
  gpgkey   => 'http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key',
  enabled  => 1
} ->

package { ['jenkins', 'maven']:
  ensure => present
} ->

service { 'jenkins':
  ensure    => 'running',
  enable    => true,
  hasstatus => true,
  require   => Package['jenkins'],
} ->

package { ['git', 'net-tools', 'vim-enhanced']:
  ensure => present
}

