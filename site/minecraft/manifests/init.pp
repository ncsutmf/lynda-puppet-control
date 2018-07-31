class minecraft {
  file { '/opt/minecraft' :
    ensure => directory,
  }
  file {'/opt/minecraft/mincraft_server.jar' :
    ensure => file,
#    source => 'https://launcher.mojang.com/mc/game/1.13/server/d0caafb8438ebd206f99930cfaecfa6c9a13dca0/server.jar',
    source => 'https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar',
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
