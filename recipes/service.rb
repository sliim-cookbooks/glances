# -*- coding: utf-8 -*-
#
# Cookbook Name:: glances
# Recipe:: service
#
# Copyright 2015, Sliim
#

include_recipe 'glances'

template '/etc/default/glances' do
  source 'glances.default.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

cookbook_file '/etc/init.d/glances' do
  source 'init_script'
  owner 'root'
  group 'root'
  mode '0755'
end

service 'glances' do
  action [:enable, :start]
  supports status: true, start: true, stop: true, restart: true
end