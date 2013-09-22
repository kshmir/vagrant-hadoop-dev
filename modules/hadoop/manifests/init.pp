class hadoop {
 $hadoop_home = "/opt/hadoop"

file { 
  "/tmp/hadoop.tar.gz": 
  source => "puppet:///modules/hadoop/hadoop.tar.gz",
  mode => 644,
  owner => root,
  group => root,
  require => Package["openjdk-6-jdk"]
}

exec { "unpack_hadoop":
  command => "tar -zxf /tmp/hadoop.tar.gz -C /opt",
  path => $path,
  creates => "${hadoop_home}-1.2.1",
  require => File["/tmp/hadoop.tar.gz"]
}

file {
  "${hadoop_home}-1.2.1/conf/slaves":
  source => "puppet:///modules/hadoop/slaves",
  mode => 644,
  owner => root,
  group => root,
  require => Exec["unpack_hadoop"]
 }
 
file {
  "${hadoop_home}-1.2.1/conf/masters":
  source => "puppet:///modules/hadoop/masters",
  mode => 644,
  owner => root,
  group => root,
  require => Exec["unpack_hadoop"]
 }

file {
  "${hadoop_home}-1.2.1/conf/core-site.xml":
  source => "puppet:///modules/hadoop/core-site.xml",
  mode => 644,
  owner => root,
  group => root,
  require => Exec["unpack_hadoop"]
 }
 
file {
  "${hadoop_home}-1.2.1/conf/mapred-site.xml":
  source => "puppet:///modules/hadoop/mapred-site.xml",
  mode => 644,
  owner => root,
  group => root,
  require => Exec["unpack_hadoop"]
 }
 
 file {
  "${hadoop_home}-1.2.1/conf/hdfs-site.xml":
  source => "puppet:///modules/hadoop/hdfs-site.xml",
  mode => 644,
  owner => root,
  group => root,
  require => Exec["unpack_hadoop"]
 }
 
  file {
  "${hadoop_home}-1.2.1/conf/hadoop-env.sh":
  source => "puppet:///modules/hadoop/hadoop-env.sh",
  mode => 644,
  owner => root,
  group => root,
  require => Exec["unpack_hadoop"]
 }
}
