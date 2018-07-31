class profile::ssh_server {
	package {'openssh-server':
		ensure => present,
	}
	service { 'sshd':
		ensure => 'running',
		enable => 'true',
	}
	ssh_authorized_key { 'root@master.puppet.vm':
		ensure => present,
		user   => 'root',
		type   => 'ssh-rsa',
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCpHpzYCJzPjKIo750Q7LtsoB/Cq8h3wq9/ajlNMAGvvKLm7bUKTDcHb9bnGyAdyJA5tdBfuVzgDpcECuHZSL0kWUMqh3+QdD7wdeOPf4HIC7ay6iIiphdES59H3n8wT3N0VRcJLzJmORPU18oo1bCg32dguMx+Tyls8XYANHUbRpX4z+s1JCprs5lI2IPvYCjhGOsnjV70Or7b90xXKKY07Njn+IKgKKMv6jw1/LstJaup3vIDggKE8jK17ZWYJ7jdlA7gjr8sTl8ueV0dSbtl2G3lgbu07MhB7qPooxXpvNKtPZjt37Z3wglz4BWrn1mRdh2AbiGTmlh0v1lfoIGD',
	}  
}
