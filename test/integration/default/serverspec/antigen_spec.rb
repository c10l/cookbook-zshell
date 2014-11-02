require 'serverspec'

# Required by serverspec
set :backend, :exec

describe "zsh::antigen" do

  it { expect(file('/usr/lib/antigen/antigen.zsh')).to be_file }

end
