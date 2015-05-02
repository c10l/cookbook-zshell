require 'spec_helper'

TestUser = Struct.new(:gid)

describe 'test::zgen' do
  before do
    test_user = TestUser.new
    test_user.gid = 'test_group'
    allow(Etc).to receive(:getpwnam).and_return(test_user)
    allow(Dir).to receive(:home).and_return('/home/test_zgen_user')
  end

  let(:runner) { ChefSpec::SoloRunner.new( :step_into => [ 'zshell_antigen' ] ) }
  let(:chef) { runner.converge(described_recipe) }

  context 'action_enable' do
    context 'init' do
      it { expect(chef).to create_directory('/home/test_zgen_user/.zgen') }
      it { expect(chef).to create_directory('/home/test_zgen_user/.zgen').with_owner('test_zgen_user') }
      it { expect(chef).to sync_git('/home/test_zgen_user/.zgen/repo').with_repository('https://github.com/tarjoilija/zgen.git') }
      it { expect(chef).to sync_git('/home/test_zgen_user/.zgen/repo').with_user('test_zgen_user') }
    end

    it { expect(chef).to install_package('git') }
    it { expect(chef).to create_zshell_rcfile('antigen') }
    it { expect(chef).to create_zshell_rcfile('antigen').with_user('test_zgen_user') }
  end
end
