# encoding: utf-8
class RootController < App
	get "/" do
		@title = "Sinatra app template"
		slim :main
	end
end
