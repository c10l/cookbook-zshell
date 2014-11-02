zsh_rcfile 'test_content' do
  user 'test_user'
  content 'test_content'
  order '10'
  action :create
end

zsh_rcfile 'test_delete' do
  user 'test_user'
  order '20'
  action :delete
end
