#
# Cookbook Name:: zshell
# Recipe:: default
#
# Copyright (c) 2014 Cassiano Leal, All Rights Reserved.

package "zsh" do
  action :install
end

case node['platform_family']
when "debian" then package "zsh-doc"
when "rhel", "fedora" then package "zsh-html"
end
