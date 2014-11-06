zshell_rcfile 'test_content1' do
  user 'test_user'
  content 'test_content'
  order '10'
  action :create
end

zshell_rcfile 'test_content2' do
  user 'test_user'
  source 'rcfile.erb'
  cookbook 'test'
  variables({
    :variable => 'dynamic text'
  })
  order '20'
  action :create
end

zshell_rcfile 'test_delete' do
  user 'test_user'
  order '20'
  action :delete
end
