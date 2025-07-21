#
# Cookbook:: mongodb
# Recipe:: default
#
# Copyright:: 2025, The Authors, All Rights Reserved.
  execute 'install gnupg and curl' do
    command 'apt-get install -y gnupg curl'
    action :run
  end
  
  # Agregar la clave GPG de MongoDB
  execute 'add mongodb gpg key' do
    command 'curl -fsSL https://www.mongodb.org/static/pgp/server-6.0.asc | \
     gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg --dearmor'
    action :run
    not_if { ::File.exist?('/usr/share/keyrings/mongodb-server-6.0.gpg') }
  end
  
  # Agregar el repositorio de MongoDB
execute 'add mongodb repository' do
  command 'echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" > /etc/apt/sources.list.d/mongodb-org-6.0.list'
  action :run
  not_if { ::File.exist?('/etc/apt/sources.list.d/mongodb-org-6.0.list') }
end  
  # Actualizar los repositorios
  execute 'update apt repositories' do
    command 'apt-get update'
    action :run
  end
  
  # Instalar MongoDB
  package 'mongodb-org' do
    action :install
  end
  
  # Habilitar y arrancar el servicio de MongoDB
  service 'mongod' do
    action [:enable, :start]
  end
