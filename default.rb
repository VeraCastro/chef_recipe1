#
# Cookbook:: actividad2
# Recipe:: default
#
# Copyright:: 2025, The Authors, All Rights Reserved.
#package 'apache2' do  
#  action :install  
#end  
  
#service 'apache2' do  
#  action [:enable, :start]  
#end


execute 'install gnupg and curl' do
  command 'apt-get install -y gnupg curl'
  action :run
end

execute 'add mongodb gpg key' do 
  command 'curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg \
   --dearmor'
  action:run
  not_if { ::File.exist?('/usr/share/keyrings/mongodb-server-8.0.gpg') } # Evita repetir si ya exist
end 

# Agregar el repositorio de MongoDB  
file '/etc/apt/sources.list.d/mongodb-org-8.0.list' do
  content 'deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/8.0 multiverse'
  mode '0644'
  action :create
end

execute 'apt-get update' do
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
