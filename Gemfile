source :rubygems
gem 'thin'
gem 'slim'
gem 'sinatra'
gem 'sinatra-partial'
gem 'sprockets'
gem 'coffee-script'
#gem 'therubyracer'
gem 'rake'
gem 'rack-flash3'
gem 'awesome_print'
gem 'sequel'
group :test do
  gem 'webrat'
  gem 'cucumber' # good for ui/it
  gem 'minitest' # good for other tests
  gem 'rspec' # required by cucumber
end
group :test, :development do
  gem 'sqlite3'
end
group :production do
  gem 'mysql2'
end
group :development do
  gem 'sqlite3'
  gem 'sinatra-reloader'
  gem 'sinatra-activerecord'
  gem 'pry'
end
