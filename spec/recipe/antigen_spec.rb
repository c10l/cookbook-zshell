require 'spec_helper'

describe 'zsh::antigen' do

  let(:runner) { ChefSpec::Runner.new }
  let(:chef) { runner.converge(described_recipe) }

  it { expect(chef).to create_directory('/usr/lib/antigen') }
  it { expect(chef).to create_remote_file('/usr/lib/antigen/antigen.zsh').with_source('https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh') }

end
