Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/focal64"
  
    # Configuración de red
    config.vm.network "forwarded_port", guest: 27017, host: 27017
  
    # Provisionador de Chef
    config.vm.provision "chef_solo" do |chef|
      chef.cookbooks_path = ["cookbooks"]
      chef.add_recipe "mongodb"
      chef.log_level = :debug
      chef.arguments = "--chef-license accept"
    end
  
    # Configuración del proveedor VirtualBox
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
  
  end
