use_inline_resources

action :enable do
  init

  zshell_rcfile 'antigen' do
    user new_resource.user
    source 'rcfile_antigen.erb'
    cookbook 'zshell'
    variables( { :resource => new_resource } )
    order '00'
  end
end

action :disable do
  zshell_rcfile 'antigen' do
    user new_resource.user
    order '00'
    action :delete
  end
end

def init
  directory antigen_home do
    owner new_resource.user
    group Etc.getpwnam(new_resource.user).gid
    mode '0755'
    action :create
  end

  remote_file "#{antigen_home}/antigen.zsh" do
    source new_resource.antigen_url
    owner new_resource.user
    group Etc.getpwnam(new_resource.user).gid
    mode '0644'
    action :create
  end
end

def antigen_home
  ::File.join(::Dir.home(new_resource.user), '/.antigen')
end
