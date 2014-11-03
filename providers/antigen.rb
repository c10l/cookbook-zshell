action :enable do

  zsh_rcfile 'antigen' do
    user new_resource.user
    content ''
    order '00'
  end

end

action :disable do
end
