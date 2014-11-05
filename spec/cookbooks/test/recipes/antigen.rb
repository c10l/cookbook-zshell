zsh_antigen 'test_user' do
  completion_waiting_dots true
  use [ 'oh-my-zsh' ]
  theme 'agnoster'
  bundle [ 'bundle1', 'bundle2' ]
  action :enable
end

zsh_antigen 'test_user2' do
  completion_waiting_dots true
  use [ 'oh-my-zsh' ]
  theme 'agnoster'
  bundle [ 'bundle1', 'bundle2' ]
  action :enable
end

zsh_antigen 'test_user2' do
  action :disable
end
