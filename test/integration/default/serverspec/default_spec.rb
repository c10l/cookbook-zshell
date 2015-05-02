require 'serverspec'

# Required by serverspec
set :backend, :exec

describe "zshell::default" do
  context package('zsh') do
    it { should be_installed }
  end
end
