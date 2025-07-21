#
# Cookbook:: actividad2
# Recipe:: Receta para instalar y activar Apache (httpd en Linux, apache2 en Windows)
# Copyright:: 2025, David Huerta Bustamante, All Rights Reserved.

Chef::Config[:chef_license] = "accept" # Aceptar licencia de Chef desde la receta

package 'apache2' do #Instala el paquete apache2
  action :install
end

service 'apache2' do #Inicia el servidor de apache2
  action [:enable, :start]
end

