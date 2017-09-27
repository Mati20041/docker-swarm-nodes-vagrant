# -*- mode: ruby -*-
# vi: set ft=ruby :

numberOfNodes = 3
dockerJoinToken = ''
leaderIp = '192.168.56.5'

Vagrant.configure("2") do |config|
  (1..numberOfNodes).each do |i|
  	config.vm.define "node-#{i}" do |node|
    	node.vm.box = "ubuntu/xenial64"
    	node.vm.hostname = "swarm-node-#{i}"
      node.vm.network "private_network", ip: "192.168.56.#{50+i}", virtualbox__intnet: 'docker-network'
      node.vm.provider 'virtualbox' do |v|
  			v.memory = 1024
  			v.cpus = 1
      end
      node.vm.provision "shell", path: 'install-docker.sh'
      node.vm.provision "shell", inline: 'sudo docker swarm join --token ' + dockerJoinToken + " #{leaderIp}:2377"
  	end
  end
end
