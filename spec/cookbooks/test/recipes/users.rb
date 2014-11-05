%w{ test_user test_user2 }.each do |username|

  user username do
    provider Chef::Provider::User::Useradd
    home "/home/#{username}"
    supports({ :manage_home => true })
    action :create
  end

end
