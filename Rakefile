require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec'
require 'rspec/core/rake_task'

desc "Run specs"
RSpec::Core::RakeTask.new :spec

desc "Run integrations"
RSpec::Core::RakeTask.new :scenarios do |task|
  task.pattern = 'scenarios/**/*_spec.rb'
end
task :default => [:spec, :scenarios]
