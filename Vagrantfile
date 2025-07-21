Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"

  config.vm.provision "chef_solo" do |chef|  
  chef.cookbooks_path = ["cookbooks"]  
  chef.add_recipe "actividad2"  
  chef.arguments = "--log_level debug --chef-license accept-silent"  
end

  config.vm.network "forwarded_port", guest: 27017, host: 27017
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1048"
  end
end
