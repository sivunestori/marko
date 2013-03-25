#
# From https://raw.github.com/padrino/padrino-recipes/master/files/watchrs/test.watchr
#
# install watchr
# $ gem install watchr
#
# Run With:
# $ watchr test.watchr
#

# --------------------------------------------------
# Helpers
# --------------------------------------------------

def run(cmd)
  exec = "bundle exec ruby #{cmd}"
  puts(exec)
  system(exec)
end
 
def run_all 
  system("bundle exec rake test")
end

# --------------------------------------------------
# Watchr Rules
# --------------------------------------------------
watch("^lib/(.*)\.rb")                     { |m| run("test/lib/#{m[1]}_test.rb") }

watch("^(.*)/controllers/(.*).rb")           { |m| run("test/#{m[1]}/controllers/#{m[2]}_controller_test.rb") }
watch("^test/(.*)/controllers/(.*)_test.rb") { |m| run("test/#{m[1]}/controllers/#{m[2]}_test.rb") }

watch("^(.*)/models/(.*).rb")                { |m| run("test/#{m[1]}/models/#{m[2]}_test.rb") }
watch("^test/(.*)/(.*)_test.rb")             { |m| run("test/#{m[1]}/models/#{m[2]}_test.rb") }

watch("test.*/test_helper\.rb")              { run_all }
watch("^test/(.*)_test\.rb")                 { |m| run("test/#{m[1]}_test.rb") }

# --------------------------------------------------
# Signal Handling
# --------------------------------------------------
# Ctrl-\ or Ctrl-ö (Swedish keyboard)
Signal.trap('QUIT') do
  puts "Quitting..."
  abort("\n") 
end

# Ctrl-C
Signal.trap('INT') do 
  puts " --- Running all tests ---\n\n"
  run_all
end

# Find your signals...
#Signal.list.each do |name, num|
#  Signal.trap(num) do 
#    puts "#{name}"
#  end rescue "xx"
#end
