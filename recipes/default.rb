# Cookbook:: glances
# Recipe:: default
# Copyright:: 2015-2020 Sliim

include_recipe 'spython'

spython_runtime node['glances']['python']

spython_package 'Glances' do
  version node['glances']['version']
  runtime node['glances']['python']
end

node['glances']['extra_pip_packages'].each do |pkg|
  spython_package pkg do
    runtime node['glances']['python']
  end
end

directory '/etc/glances' do
  owner 'root'
  group 'root'
  mode '0755'
end

template '/etc/glances/glances.conf' do
  source 'glances.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end
