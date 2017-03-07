name             'zshell'
maintainer       'Cassiano Leal'
maintainer_email 'cassianoleal@gmail.com'
license          'Apache v2.0'
description      'Installs/Configures zsh'
long_description 'Installs/Configures zsh'
version          '0.4.1'
issues_url       'https://github.com/cassianoleal/cookbook-zshell/issues'
source_url       'https://github.com/cassianoleal/cookbook-zshell'

recipe "zshell", "Install zsh"

depends "apt"

%w{ubuntu debian centos redhat amazon scientific fedora}.each do |os|
  supports os
end
