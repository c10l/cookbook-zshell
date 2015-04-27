if defined?(ChefSpec)
  def create_zshell_rcfile(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:zshell_rcfile, :create, resource_name)
  end

  def delete_zshell_rcfile(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:zshell_rcfile, :delete, resource_name)
  end

  def enable_zshell_antigen(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:zshell_antigen, :enable, resource_name)
  end

  def disable_zshell_antigen(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:zshell_antigen, :disable, resource_name)
  end
end
