require 'serverspec'

# Required by serverspec
set :backend, :exec

describe "zshell::default" do

  context package('zsh') do
    it { expect(subject).to be_installed }
  end

end
