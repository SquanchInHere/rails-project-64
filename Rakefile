# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'slim_lint/rake_task'

SlimLint::RakeTask.new do |t|
  t.config = '.slim-lint.yml'
  t.quiet = false
end

Rails.application.load_tasks
