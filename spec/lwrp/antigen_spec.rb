require 'spec_helper'

describe 'test::antigen' do

  let(:runner) { ChefSpec::Runner.new( :step_into => [ 'zsh_antigen' ] ) }
  let(:chef) { runner.converge(described_recipe) }

  context 'action_enable' do

    it { expect(chef).to create_zsh_rcfile('antigen') }

  end

end
