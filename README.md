[![Build Status](https://travis-ci.org/cassianoleal/cookbook-zshell.png)](https://travis-ci.org/cassianoleal/cookbook-zshell)

# zshell cookbook

This is a Chef cookbook to install and configure `zshell`.

There are 2 LWRPs present, one for arbitrary commands to be added to the shell initialisation ([`zshell_rcfile`](#zshell_rcfile)) and the other to install and configure [antigen](https://github.com/zshell-users/antigen) ([`zshell_antigen`](#zshell_antigen)).

# Usage

In order to install `zsh` you just need to include the default recipe in your node's `run_list`:

### In a recipe:

```ruby
include 'zshell::default'
```

### In a role:

```json
{
  "run_list": [
    "recipe[zshell::default]"
  ]
}
```

# LWRP

## zshell_rcfile

This LWRP supports two actions:

* `:create` (default)
* `:delete`

### Defining the file's content inline with `content`

This snippet creates a file called `~/.zshrc.d/10-java_home.zsh` for user `username`.

```ruby
zshell_rcfile 'java_home' do
  user 'username'
  content 'JAVA_HOME=/usr/java'
  order '10'
  action :create
end
```

### Passing a template to be rendered

This creates a file called `~/.zshrc.d/20-complex_setup.zsh`.

```ruby
zshell_rcfile 'complex_setup' do
  user 'username'
  source 'rcfile.erb'
  cookbook 'my_wrapper_cookbook'
  variables({
    :my_template_variable => 'some value'
  })
  order '20'
  action :create
end
```

## zshell_antigen

This LWRP supports two actions:

* `:enable` (default)
* `:disable`

```ruby
zshell_antigen 'username' do
  antigen_url 'https://cdn.rawgit.com/zsh-users/antigen/latest/bin/antigen.zsh'
  completion_waiting_dots true
  use [ 'oh-my-zsh' ]
  theme 'agnoster'
  bundle [ 'git', 'bundler' ]
  action :enable
end
```

### Alternate provider: Zgen

Version 0.2.0 adds an alternative provider for this resource that uses [zgen](https://github.com/tarjoilija/zgen). To use it, set the `provider` attribute to `Chef::Provider::ZshellZgen`. All regular antigen options are supported, and a new `zgen_load` parameter was added to support the `zgen load` function:

```ruby
zshell_antigen 'username' do
  provider Chef::Provider::ZshellZgen
  completion_waiting_dots true
  use [ 'oh-my-zsh' ]
  theme 'agnoster'
  bundle [ 'git', 'bundler' ]
  zgen_revision 'master'
  zgen_load [ 'zsh-users/zsh-syntax-highlighting', 'supercrabtree/k', 'zsh-users/zsh-completions src' ]
  action :enable
end
```

# Author

Cassiano Leal ( [email](<mailto:cassianoleal@gmail.com>) | [twitter](http://twitter.com/cassianoleal) | [github](https://github.com/cassianoleal) )
