#!/usr/bin/env rake

require 'foodcritic'
require 'rspec/core/rake_task'

task :default => [:foodcritic, :spec]

FoodCritic::Rake::LintTask.new

RSpec::Core::RakeTask.new
