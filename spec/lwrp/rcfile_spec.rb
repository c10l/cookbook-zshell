require 'spec_helper'

TestUser = Struct.new(:gid)

describe 'test::rcfile' do
  before do
    test_user = TestUser.new
    test_user.gid = 'test_group'
    allow(Etc).to receive(:getpwnam).and_return(test_user)
    allow(Dir).to receive(:home).and_return('/home/test_user')
  end

  let(:runner) { ChefSpec::SoloRunner.new( :step_into => [ 'zshell_rcfile' ] ) }
  let(:chef) { runner.converge(described_recipe) }

  context 'action_create' do
    context 'content' do
      zshellfile = '/home/test_user/.zshrc.d/10-test_content1.zsh'

      it { expect(chef).to create_template(zshellfile) }
      it { expect(chef).to create_template(zshellfile).with_cookbook('zshell') }
      it { expect(chef).to render_file(zshellfile).with_content('test_content') }
    end

    context 'template' do
      zshellfile = '/home/test_user/.zshrc.d/20-test_content2.zsh'

      it { expect(chef).to create_template(zshellfile) }
      it { expect(chef).to create_template(zshellfile).with_source('rcfile.erb') }
      it { expect(chef).to create_template(zshellfile).with_cookbook('test') }
      it { expect(chef).to render_file(zshellfile).with_content('variable: dynamic text') }
    end

    context 'init' do
      it { expect(chef).to create_directory( '/home/test_user/.zshrc.d' ) }
      it { expect(chef).to create_cookbook_file( '/home/test_user/.zshrc' ) }

      context 'has_old_config' do
        before do
          allow(File).to receive(:exists?).and_call_original
          allow(File).to receive(:exists?).with('/home/test_user/.zshrc').and_return(true)
          allow(IO).to receive(:read).and_call_original
          allow(IO).to receive(:read).with('/home/test_user/.zshrc').and_return('')
        end

        it { expect(chef).to create_file( '/home/test_user/.zshrc.d/00-old_config.zsh' ) }
      end

      context 'no_old_config' do
        before do
          allow(File).to receive(:exists?).and_call_original
          allow(File).to receive(:exists?).with('/home/test_user/.zshrc').and_return(false)
        end

        it { expect(chef).to touch_file( '/home/test_user/.zshrc.d/00-old_config.zsh' ) }
      end

      context 'already_converged' do
        before do
          allow(File).to receive(:exists?).and_call_original
          allow(File).to receive(:exists?).with('/home/test_user/.zshrc.d/00-old_config.zsh').and_return(true)
        end

        it { expect(chef).not_to create_file( '/home/test_user/.zshrc.d/00-old_config.zsh' ) }
        it { expect(chef).not_to touch_file( '/home/test_user/.zshrc.d/00-old_config.zsh' ) }
      end
    end
  end

  context 'action_delete' do
    it { expect(chef).to delete_file('/home/test_user/.zshrc.d/20-test_delete.zsh') }
  end
end
