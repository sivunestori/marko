require 'bundler/setup'
require 'rake'
require 'pry'
require 'rake/testtask'
require './app'

Dir[File.join('lib', 'tasks', '**', '*.rake')].each do |file|
  import file
end

Rake::TestTask.new do |t|
  t.pattern = "test/controllers/*_spec.rb"
  t.pattern = "test/models/*_spec.rb"
end

task :console do
  binding.pry
end

# Asset pipeline (Sprockets)
#namespace :assets do
#  task :compile do
#    App.sprockets['application.js'].write_to('public/assets/application.js')
#    App.sprockets['application.css'].write_to('public/assets/application.css')
#  end
#end

