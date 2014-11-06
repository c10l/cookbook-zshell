[![Build Status](https://travis-ci.org/cassianoleal/cookbook-zsh.png)](https://travis-ci.org/cassianoleal/cookbook-zsh)

# zsh cookbook

This is a Chef cookbook to install and configure `zsh`.

There are 2 LWRPs present, one for arbitrary commands to be added to the shell initialisation ([`zsh_rcfile`](#zsh_rcfile)) and the other to install and configure [antigen](https://github.com/zsh-users/antigen) ([`zsh_antigen`](#zsh_antigen)).

# Usage

In order to install `zsh` you just need to include the default recipe in your node's `run_list`:

### In a recipe:

```ruby
include 'zsh::default'
```

### In a role:

```json
{
  "run_list": [
    "recipe[zsh::default]"
  ]
}
```

# LWRP

## <a id="zsh_rcfile"></a>zsh_rcfile

This LWRP supports two actions:
* `:create` (default)
* `:delete`

### Defining the file's content inline with `content`

This snippet creates a file called `~/.zshrc.d/10-java_home.zsh` for user `username`.

```ruby
zsh_rcfile 'java_home' do
  user 'username'
  content 'JAVA_HOME=/usr/java'
  order '10'
  action :create
end
```

### Passing a template to be rendered

This creates a file called `~/.zshrc.d/20-complex_setup.zsh`.

```ruby
zsh_rcfile 'complex_setup' do
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

## <a id="zsh_antigen"></a>zsh_antigen

This LWRP supports two actions:
* `:enable` (default)
* `:disable`

```ruby
zsh_antigen 'username' do
  completion_waiting_dots true
  use [ 'oh-my-zsh' ]
  theme 'agnoster'
  bundle [ 'git', 'bundler' ]
  action :enable
end
```

# Author

Cassiano Leal ([email](<mailto:cassianoleal@gmail.com>) | [twitter](http://twitter.com/cassianoleal) | [github](https://github.com/cassianoleal))
