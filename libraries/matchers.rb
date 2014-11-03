if defined?(ChefSpec)

  def create_zsh_rcfile(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:zsh_rcfile, :create, resource_name)
  end

  def delete_zsh_rcfile(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:zsh_rcfile, :delete, resource_name)
  end

end
