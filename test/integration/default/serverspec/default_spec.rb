require 'serverspec'

# Required by serverspec
set :backend, :exec

describe "zsh::default" do

  it { expect(package('zsh')).to be_installed }

end
