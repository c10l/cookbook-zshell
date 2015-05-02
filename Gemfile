source 'https://rubygems.org/'

gem 'chefspec'
gem 'test-kitchen'
gem 'kitchen-docker'
gem 'berkshelf'
gem 'rake'

group :delevopment do
  gem 'kitchen-vagrant'
  gem 'guard'
  # This is here until the time when https://github.com/cgriego/guard-foodcritic/pull/8
  # is merge, or one of the forks is released under a new name
  gem 'guard-foodcritic', github: 'Nordstrom/guard-foodcritic', ref: 'use_guard_v2_api'
  gem 'guard-rspec'
end
