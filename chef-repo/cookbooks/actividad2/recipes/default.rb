#Cookbook:: actividad2
# Recipe:: Receta para crear un usuario, un directorio personalizado y un archivo de configuración
# Copyright:: 2025, David Huerta Bustamante, All Rights Reserved.

Chef::Config[:chef_license] = "accept"

# Crear usuario 'despliegue'
user 'despliegue' do
  comment 'Usuario para tareas de despliegue automatizado'
  home '/home/despliegue'
  shell '/bin/bash'
  manage_home true
  action :create
end

# Crear directorio /opt/app_config con permisos
directory '/opt/app_config' do
  owner 'despliegue'
  group 'despliegue'
  mode '0755'
  action :create
end

# Crear archivo de configuración
file '/opt/app_config/config.txt' do
  content <<~CONFIG
    # Configuración generada por Chef
    ambiente = produccion
    version = 1.0.0
    autor = David y Veronica
  CONFIG
  owner 'despliegue'
  group 'despliegue'
  mode '0644'
  action :create
end
