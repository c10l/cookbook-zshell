if defined?(ChefSpec)

  def create_zshell_rcfile(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:zshell_rcfile, :create, resource_name)
  end

  def delete_zshell_rcfile(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:zshell_rcfile, :delete, resource_name)
  end

end
