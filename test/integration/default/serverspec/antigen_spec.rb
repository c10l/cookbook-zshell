require 'serverspec'

# Required by serverspec
set :backend, :exec

describe "zshell::antigen" do

  context 'action :enable' do

    context file('/home/test_user/.antigen/antigen.zsh') do
      it { expect(subject).to be_file }
    end

    context file('/home/test_user/.zshrc.d/00-antigen.zsh') do
      it { expect(subject).to be_file }
    end

  end

  context 'action :disable' do

    context file('/home/test_user2/.zshrc.d/00-antigen.zsh') do
      it { expect(subject).not_to be_file }
    end

  end

  context 'zgen provider' do

    context file('/home/test_zgen_user/.zgen/repo/zgen.zsh') do
      it { expect(subject).to be_file }
    end

    context file('/home/test_zgen_user/.zshrc.d/00-antigen.zsh') do
      it { expect(subject).to be_file }
      it { expect(subject.content).to match( /zgen/ ) }
    end

  end

end
