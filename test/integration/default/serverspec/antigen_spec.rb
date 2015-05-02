require 'serverspec'

# Required by serverspec
set :backend, :exec

describe "zshell::antigen" do
  context 'action :enable' do
    context file('/home/test_user/.antigen/antigen.zsh') do
      it { should be_file }
      it { should be_owned_by('test_user') }
    end

    context file('/home/test_user/.zshrc.d/00-antigen.zsh') do
      it { should be_file }
      it { should be_owned_by('test_user') }
    end
  end

  context 'action :disable' do
    context file('/home/test_user2/.zshrc.d/00-antigen.zsh') do
      it { should_not be_file }
    end
  end

  context 'zgen provider' do
    context file('/home/test_zgen_user/.zgen/repo/zgen.zsh') do
      it { should be_file }
      it { should be_owned_by('test_zgen_user') }
    end

    context file('/home/test_zgen_user/.zshrc.d/00-antigen.zsh') do
      it { should be_file }
      it { should be_owned_by('test_zgen_user') }
      its(:content) { should match( /zgen/ ) }
    end
  end
end
