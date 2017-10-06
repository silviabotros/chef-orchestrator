#!/usr/bin/env rake
require 'rake'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
  warn 'It looks like the Chef DK is not configured. Download the Chef DK'\
       " via\nhttps://downloads.chef.io/chefdk. On Linux and"\
       " Mac OS X\nadd to $PATH with:\n"\
       '    eval "$(chef shell-init $SHELL)"'
end

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new do |task|
    task.fail_on_error = true
    task.options = %w(--display-cop-names -c .rubocop.yml)
  end
rescue LoadError
  warn '>>>>> Rubocop gem not loaded, omitting tasks'
end

begin
  require 'foodcritic/rake_task'
  require 'foodcritic'
  task default: [:foodcritic]
  FoodCritic::Rake::LintTask.new do |task|
    task.options = {
      fail_tags: ['any']
    }
  end
rescue LoadError
  warn '>>>>> foodcritic gem not loaded, omitting tasks'
end

task default: 'test:quick'
namespace :test do
  desc 'Run all the quick tests'
  task :quick do
    Rake::Task['rubocop'].invoke
    Rake::Task['foodcritic'].invoke
    Rake::Task['spec'].invoke
    Rake::Task['kitchen:verify'].invoke
  end
end

namespace :kitchen do
  desc 'converge'
  task :converge do
    sh 'kitchen converge'
  end
  desc 'debug'
  task :converge do
    sh 'kitchen converge -l debug'
  end
  desc 'run serverspec tests'
  task :verify do
    Rake::Task['kitchen:converge'].invoke
    sh 'kitchen verify'
  end
  desc 'run serverspec tests and destroy if successful'
  task :test do
    sh 'kitchen test'
  end
  desc 'destroy test kitchen vms'
  task :destroy do
    sh 'kitchen destroy'
  end
end
