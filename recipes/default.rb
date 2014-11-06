#
# Cookbook Name:: zshell
# Recipe:: default
#
# Copyright (c) 2014 Cassiano Leal, All Rights Reserved.

package "zsh" do
  action :install
end

case node['platform_family']
when "debian"
  package "zsh-doc" do
    action :install
  end
when "rhel", "fedora"
  package "zsh-html" do
    action :install
  end
end
