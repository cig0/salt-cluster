# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
  end
  
  ## Configure VMs

  config.vm.define "nginx" do |nginx|
    nginx.vm.box = "debian/contrib-stretch64"
    nginx.vm.hostname = "nginx"
    nginx.vm.network "private_network", ip: "192.168.0.6"
    nginx.vm.network :forwarded_port, guest: 8080, host: 8080
    nginx.vm.provision "shell", path: "vagrant.provisioning/minions/shared.bash"
  end

  config.vm.define "postgres" do |postgres|
    postgres.vm.box = "debian/contrib-stretch64"
    postgres.vm.hostname = "postgres"
    postgres.vm.network "private_network", ip: "192.168.0.7"
    postgres.vm.provision "shell", path: "vagrant.provisioning/minions/shared.bash"
    postgres.vm.provision "shell", path: "vagrant.provisioning/minions/postgres.bash"
  end

  config.vm.define "saltmaster" do |salt|
    salt.vm.box = "debian/contrib-stretch64"
    salt.vm.hostname = "salt"
    salt.vm.network "private_network", ip: "192.168.0.5"
    salt.vm.provision "shell", path: "vagrant.provisioning/saltmaster/saltmaster.bash"
    salt.vm.provision "file", source: "vagrant.provisioning/saltmaster/config", destination: "$HOME/.ssh/config"
    salt.vm.synced_folder "srv", "/srv", owner: "vagrant", group: "vagrant"    
  end
  
end
