zshell_antigen 'test_zgen_user' do
  provider Chef::Provider::ZshellZgen
  completion_waiting_dots true
  use [ 'oh-my-zsh' ]
  theme 'agnoster'
  bundle [ 'bundle1', 'bundle2' ]
  zgen_load [ 'repo/module', 'repo2/module2 branch' ]
  action :enable
end
