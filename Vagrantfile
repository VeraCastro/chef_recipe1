# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "forwarded_port", guest: 27017, host: 27017

  config.vm.provision "chef_solo" do |chef|  
    chef.cookbooks_path = ["cookbooks"]  
    chef.add_recipe "apache"  
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end
 
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
     apt-get install -y chef
  SHELL
end
