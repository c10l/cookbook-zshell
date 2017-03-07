# changelog

### Version 0.4.1

Add `source_url` and `issues_url` to metadata

### Version 0.4.0

Make the antigen download URL parameterised and update the default.

Parameterise the git revision of the zgen repo.

### Version 0.3.0

This version alters the behaviour of the plugin the first time it's run.

Prior to this, if the user had a `~/.zshrc` file, it would be added as a `.zsh` file to the `~/.zshrc.d/` directory, with order `00`.

Starting from this version, the cookbook assumes all configuration the user requires is implemented as `rcfile` resources instead.
