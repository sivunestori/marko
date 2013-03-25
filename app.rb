# encoding: utf-8
require 'sinatra/base'
require 'sinatra/partial'
require 'slim'
require 'sequel'

require_relative 'minify_resources'
class App < Sinatra::Base
  register Sinatra::Partial
	enable :logging
  use Rack::Session::Cookie

  DB = Sequel.connect(YAML::load(File.open('config/database.yml'))[App.environment.to_s])

  set :views, File.dirname(__FILE__) + '/app/views'
  set :slim, :layout_engine => :slim, 
             :layout => :'layouts/default', 
             :pretty => true, 
             :format => :html5
  set :partial_underscores, true
  set :partial_template_engine, :slim

  # for some reason both of the below refuse to work
  # enable :partial_underscores

  %w(helpers models controllers concerns).each do |name|
    Dir[File.join('app', name, '**/*.rb')].each do |file|
      require_relative file
    end
  end

	configure :production do
		set :clean_trace, true
		set :css_files, :blob
		set :js_files,  :blob
		MinifyResources.minify_all
	end

	configure :development do
    require "sinatra/reloader"
    register Sinatra::Reloader
    also_reload 'app/**/*.rb'
    also_reload 'lib/**/*.rb'
    also_reload 'conf/**/*.rb'
    set :raise_errors, true
		set :css_files, MinifyResources::CSS_FILES
		set :js_files,  MinifyResources::JS_FILES
	end

	helpers do
		include Rack::Utils
		alias_method :h, :escape_html
	end
end
