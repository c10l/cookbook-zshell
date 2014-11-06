require 'spec_helper'

describe 'zshell::default' do

  let(:runner) { ChefSpec::Runner.new }
  let(:chef) { runner.converge(described_recipe) }

  it { expect(chef).to install_package('zsh') }

  context 'debian' do
    let(:runner) { ChefSpec::Runner.new( platform: 'ubuntu', version: '14.04' ) }
    it { expect(chef).to install_package('zsh-doc') }
  end

  context 'redhat' do
    let(:runner) { ChefSpec::Runner.new( platform: 'redhat', version: '6.5' ) }
    it { expect(chef).to install_package('zsh-html') }
  end

end
