class minecraft {
  file { '/opt/minecraft' :
    ensure => directory,
  }
  file {'/opt/minecraft/mincraft_server.jar' :
    ensure => file,
    source => 'https://s3.amazonews.com/Micraft.Download/versions/1.12.2/minecreaft_server.1.12.2.jar',
  }
  package {'java':
    ensure => present,
  }
  file {'/opt/minecraft/eula.txt' :
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/mincraft.service' :
    ensure => file,
    source => 'puppet:///modules/minecraft/mincraft.service',
  }
  service {'minecraft' :
    ensure => running,
    enable => true,
  }
}
