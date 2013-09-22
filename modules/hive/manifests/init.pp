class hive {
 $hive_home = "/opt/hive"

  file { 
    "/tmp/hive.tar.gz": 
    source => "puppet:///modules/hive/hive.tar.gz",
    mode => 644,
    owner => root,
    group => root,
    require => Exec["unpack_hadoop"]
  }

  exec { "unpack_hive":
    command => "tar -zxf /tmp/hive.tar.gz -C /opt",
    path => $path,
    creates => "${hive_home}-0.11.0",
    require => File["/tmp/hive.tar.gz"]
  }
}
