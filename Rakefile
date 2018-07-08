require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

require 'spradbot'

task default: :verify

RSpec::Core::RakeTask.new(:spec) unless Rake::Task.task_defined?(:spec)

unless Rake::Task.task_defined?(:rubocop)
  desc 'run rubocop for release'
  RuboCop::RakeTask.new(:rubocop) do |task|
    task.options = ['-c.rubocop.yml', '-D']
  end
end

unless Rake::Task.task_defined?(:verify)
  desc 'Verifies current state of code for merge'
  task :verify do
    puts '== Verifying commit with specs and lints =='
    [
      ['Running Ruby specs', :spec],
      ['Linting Ruby', :rubocop]
    ].each do |message, command|
      puts "\n== #{message} =="
      Rake::Task[command].invoke
    end
  end
end

unless Rake::Task.task_defined?(:start)
  desc 'Start Spradbot'
  task :start do
    puts '== Running =='
    Spradbot::Server.start
  end
end
