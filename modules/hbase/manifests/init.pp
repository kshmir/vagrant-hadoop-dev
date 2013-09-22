class hbase {
 $hbase_home = "/opt/hbase"

file { 
  "/tmp/hbase.tar.gz": 
  source => "puppet:///modules/hbase/hbase.tar.gz",
  mode => 644,
  owner => root,
  group => root,
  require => Package["openjdk-6-jdk"]
}

exec { "unpack_hbase":
  command => "tar -zxf /tmp/hbase.tar.gz -C /opt",
  path => $path,
  creates => "${hbase_home}-0.94.11",
  require => File["/tmp/hbase.tar.gz"]
}

exec{ "create_zookeeper": 
  command => '/bin/mkdir -p /root/zookeeper',
  unless => '/usr/bin/test -d /root/zookeeper',
  require => Exec['unpack_hbase']
}

file {
  "${hbase_home}-0.94.11/conf/hbase-site.xml":
  source => "puppet:///modules/hbase/hbase-site.xml",
  mode => 644,
  owner => root,
  group => root,
  require => Exec["create_zookeeper"]
 }
}
