require ::File.join( ::File.dirname(__FILE__), 'app' )
map '/' do
  run RootController
end

