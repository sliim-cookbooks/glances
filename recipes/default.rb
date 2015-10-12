# -*- coding: utf-8 -*-
#
# Cookbook Name:: glances
# Recipe:: default
#
# Copyright 2015, Sliim
#

include_recipe 'python'

python_pip 'glances'

template '/etc/glances' do
  source 'glances.erb'
  owner 'root'
  group 'root'
  mode '0644'
  not_if { node['glances']['config'].empty? }
end
