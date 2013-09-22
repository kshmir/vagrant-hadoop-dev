class pig {
 $pig_home = "/opt/pig"

  exec { "download_pig":
    command => "wget -O /tmp/pig.tar.gz http://apache.xfree.com.ar/pig/pig-0.11.1/pig-0.11.1.tar.gz",
    path => $path,
    unless => "ls /opt | grep pig-0.11.1",
    require => Exec["unpack_hadoop"]
  }

  exec { "unpack_pig":
    command => "tar -zxf /tmp/pig.tar.gz -C /opt",
    path => $path,
    creates => "${pig_home}-0.11.1",
    require => Exec["download_pig"]
  }
}
