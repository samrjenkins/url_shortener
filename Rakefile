# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'

Rails.application.load_tasks

task default: %w[rubocop rspec yalphabetize]

task rubocop: :environment do
  puts "\n-- Running 'rubocop' rake task --\n\n"
  RuboCop::RakeTask.new do |task|
    task.fail_on_error = false
  end
end

task rspec: :environment do
  puts "\n-- Running 'rspec' rake task --\n\n"
  RSpec::Core::RakeTask.new(:spec) do |task|
    task.fail_on_error = false
    task.verbose = false
    task.rspec_opts = '--format progress'
  end
  Rake::Task['spec'].execute
end

task yalphabetize: :environment do
  puts "\n-- Running 'yalphabetize' rake task --\n\n"
  sh 'yalphabetize'
end
