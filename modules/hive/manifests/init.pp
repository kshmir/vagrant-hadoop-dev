class hive {
 $hive_home = "/opt/hive"

  exec { "download_hive":
    command => "wget -O /tmp/hive.tar.gz http://apache.xfree.com.ar/hive/hive-0.11.0/hive-0.11.0.tar.gz",
    path => $path,
    unless => "ls /opt | grep hive-0.11.0",
    require => Exec["unpack_hadoop"]
  }

  exec { "unpack_hive":
    command => "tar -zxf /tmp/hive.tar.gz -C /opt",
    path => $path,
    creates => "${hive_home}-0.11.0",
    require => Exec["download_hive"]
  }
}
