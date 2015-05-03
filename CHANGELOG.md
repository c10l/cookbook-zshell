# changelog

### Version 0.3.0

This version alters the behaviour of the plugin the first time it's run.

Prior to this, if the user had a `~/.zshrc` file, it would be added as a `.zsh` file to the `~/.zshrc.d/` directory, with order `00`.

Starting from this version, the cookbook assumes all configuration the user requires is implemented as `rcfile` resources instead.
