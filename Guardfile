guard "foodcritic", {
  :cookbook_paths => ".",
  :all_on_start => false,
} do
  watch(%r{attributes/.+\.rb$})
  watch(%r{providers/.+\.rb$})
  watch(%r{recipes/.+\.rb$})
  watch(%r{resources/.+\.rb$})
  watch(%r{^templates/(.+)})
  watch('metadata.rb')
end

guard :rspec, {
  :cmd => 'rspec',
  :all_on_start => false
} do
  watch(%r{^spec/(.+)_spec\.rb$})
  watch(%r{^(recipes)/(.+)\.rb$})   { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')      { 'spec' }
  watch('spec/ohai.json')           { 'spec' }
end

# guard 'kitchen' do
#   watch(%r{test/.+})
#   watch(%r{^recipes/(.+)\.rb$})
#   watch(%r{^attributes/(.+)\.rb$})
#   watch(%r{^files/(.+)})
#   watch(%r{^templates/(.+)})
#   watch(%r{^providers/(.+)\.rb})
#   watch(%r{^resources/(.+)\.rb})
# end
