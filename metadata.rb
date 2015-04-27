name             'zshell'
maintainer       'Cassiano Leal'
maintainer_email 'cassianoleal@gmail.com'
license          'Apache v2.0'
description      'Installs/Configures zsh'
long_description 'Installs/Configures zsh'
version          '0.2.1'

recipe "zshell", "Install zsh"

%w{ubuntu debian centos redhat amazon scientific fedora}.each do |os|
  supports os
end
