class pig {
 $pig_home = "/opt/pig"

  file { 
    "/tmp/pig.tar.gz": 
    source => "puppet:///modules/pig/pig.tar.gz",
    mode => 644,
    owner => root,
    group => root,
    require => Exec["unpack_hadoop"]
  }

  exec { "unpack_pig":
    command => "tar -zxf /tmp/pig.tar.gz -C /opt",
    path => $path,
    creates => "${pig_home}-0.11.1",
    require => File["/tmp/pig.tar.gz"]
  }
}
