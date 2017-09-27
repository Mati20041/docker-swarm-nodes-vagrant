# -*- mode: ruby -*-
# vi: set ft=ruby :
provider = 'virtualbox'
numberOfNodes = 3
dockerJoinToken = ''

Vagrant.configure("2") do |config|
  (1..numberOfNodes).each do |i|
  	config.vm.define "node-#{i}" do |node|
    	node.vm.box = "ubuntu/xenial64"
    	node.vm.hostname = "swarm-node-#{i}"
    	node.vm.provider provider do |v|
  			v.memory = 1024
  			v.cpus = 1
      end
      node.vm.provision "shell", path: 'install-docker.sh'
      node.vm.provision "shell", inline: 'read _ _ gateway _ < <(ip route list match 0/0); sudo docker swarm join --token ' + dockerJoinToken + ' $gateway:2377', run: "always"
  	end
  end
end
