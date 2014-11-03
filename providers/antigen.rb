action :enable do

  zsh_rcfile 'antigen' do
    user new_resource.user
    source 'rcfile_antigen.erb'
    cookbook 'zsh'
    variables( { :resource => new_resource } )
    order '00'
  end

end

action :disable do
end
