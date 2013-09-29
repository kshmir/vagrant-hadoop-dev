include hadoop
include hive
include pig
include hbase

group { "puppet":
  ensure => "present",
}


exec { 'replace ubuntu us archives' :
  command => "/bin/sed -i -e's/us\./ar\./' /etc/apt/sources.list" 
}

exec { 'apt-get update':
  command => '/usr/bin/apt-get update',
  require => Exec['replace ubuntu us archives']
}
package { "openjdk-6-jdk":
   ensure => present,
  require => Exec['apt-get update']
}

exec{ "create_ssh_folder": 
  command => '/bin/mkdir -p /root/.ssh',
  unless => '/usr/bin/test -d /root/.ssh',
  require => Exec['apt-get update']
}


file {
  "/root/.ssh/id_rsa":
  source => "puppet:///modules/hadoop/id_rsa",
  mode => 600,
  owner => root,
  group => root,
  require => Exec['create_ssh_folder']
 }
 
file {
  "/root/.ssh/id_rsa.pub":
  source => "puppet:///modules/hadoop/id_rsa.pub",
  mode => 644,
  owner => root,
  group => root,
  require => Exec['create_ssh_folder']
 }

exec { "add_authorized_key": 
  command => '/bin/cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys',
  require => File['/root/.ssh/id_rsa.pub']
}
