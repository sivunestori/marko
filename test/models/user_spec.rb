require File.expand_path '../../test_helper.rb', __FILE__
include Rack::Test::Methods

def app
  App
end

describe User do
  # replace with sane tests
  it "should say hai" do
    user = User.new
    assert user.hai == "hai"
  end
end
