require 'spec_helper'

TestUser = Struct.new(:gid)

describe 'test::antigen' do
  before do
    test_user = TestUser.new
    test_user.gid = 'test_group'
    allow(Etc).to receive(:getpwnam).and_return(test_user)
    allow(Dir).to receive(:home).and_return('/home/test_user')
  end

  let(:runner) { ChefSpec::SoloRunner.new( :step_into => [ 'zshell_antigen' ] ) }
  let(:chef) { runner.converge(described_recipe) }

  context 'action_enable' do
    context 'init' do
      it { expect(chef).to create_directory('/home/test_user/.antigen') }
      it { expect(chef).to create_remote_file('/home/test_user/.antigen/antigen.zsh').with_source('https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh') }
    end

    it { expect(chef).to create_zshell_rcfile('antigen') }
  end

  context 'action_disable' do
    it { expect(chef).to delete_zshell_rcfile('antigen').with_user('test_user2') }
  end
end
