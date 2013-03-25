require 'rspec/expectations'
World(RSpec::Matchers)
require 'rack/test'
require 'webrat'
require_relative '../../app'

Webrat.configure do |config|
  config.mode = :rack
end

class MyWorld
  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers

  Webrat::Methods.delegate_to_session :response_code, :response_body

  def app
    #this reeks
    eval "Rack::Builder.new {( " + File.read(File.dirname(__FILE__) + '/../../config.ru') + "\n )}"
  end
 end
 
World{MyWorld.new}
