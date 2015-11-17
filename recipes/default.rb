# -*- coding: utf-8 -*-
#
# Cookbook Name:: glances
# Recipe:: default
#
# Copyright 2015, Sliim
#

include_recipe 'python'

python_pip 'glances' do
  version node['glances']['version']
end

node['glances']['extra_pip_packages'].each do |pkg|
  python_pip pkg
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
