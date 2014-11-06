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

end
