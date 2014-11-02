#
# Cookbook Name:: zsh
# Recipe:: antigen
#
# Copyright (c) 2014 Cassiano Leal, All Rights Reserved.

directory node['zsh']['antigen']['home'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

remote_file "#{node['zsh']['antigen']['home']}/antigen.zsh" do
  source 'https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
