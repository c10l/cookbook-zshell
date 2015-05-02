require 'etc'

use_inline_resources

action :create do
  init

  if !new_resource.content.nil?
    unless new_resource.source.nil? \
      && new_resource.variables.nil? \
      && new_resource.cookbook.nil?
      raise "When setting the content property, do not set source, variables or cookbook."
    end
    template_variables = { :content => new_resource.content }
  else
    template_variables = new_resource.variables
  end

  template ::File.join(zshrc_d, "#{new_resource.order}-#{new_resource.filename}.zsh") do
    variables template_variables
    source new_resource.source || 'rcfile.erb'
    cookbook new_resource.cookbook || 'zshell'
    owner new_resource.user
    group Etc.getpwnam(new_resource.user).gid
    mode '0644'
    action :create
  end
end

action :delete do
  file ::File.join(zshrc_d, "#{new_resource.order}-#{new_resource.filename}.zsh") do
    action :delete
  end
end

def init
  directory zshrc_d do
    owner new_resource.user
    group Etc.getpwnam(new_resource.user).gid
    mode '0755'
  end

  file "#{zshrc}.zshell_cookbook_save" do
    if ::File.exists?(zshrc)
      content ::IO.read(zshrc)
      action :create
    else
      content ''
      action :create
    end
    owner new_resource.user
    group Etc.getpwnam(new_resource.user).gid
    mode '0644'
    not_if { ::File.exists?(name) }
  end

  cookbook_file zshrc do
    cookbook "zshell"
    source "zshrc"
    owner new_resource.user
    group Etc.getpwnam(new_resource.user).gid
    mode '0644'
  end
end

def zshrc_d
  ::File.join(::Dir.home(new_resource.user), ".zshrc.d")
end

def zshrc
  ::File.join(::Dir.home(new_resource.user), ".zshrc")
end
