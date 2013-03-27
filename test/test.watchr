#
# From https://raw.github.com/padrino/padrino-recipes/master/files/watchrs/test.watchr
#
# install watchr
# $ gem install watchr
#
# Run With:
# $ watchr test/test.watchr
#

# --------------------------------------------------
# Helpers
# --------------------------------------------------

# change the two commands below to something else if you do not use notify-send
def pass
  "notify-send PASS -i #{File.dirname(__FILE__)}/../tools/pass.png"
end

def fail
  "notify-send FAIL -i #{File.dirname(__FILE__)}/../tools/fail.png"
end

def run(cmd)
  exec = "bundle exec ruby #{cmd} && #{pass} || #{fail}"
  puts(exec)
  system(exec)
end

def run_all
  system("bundle exec rake test && #{pass} || #{fail}")
end


# --------------------------------------------------
# Watchr Rules
# --------------------------------------------------
watch("^lib/(.*)\.rb")                     { |m| run("test/lib/#{m[1]}_spec.rb") }

watch("^(.*)/controllers/(.*).rb")           { |m| run("test/controllers/#{m[2]}_spec.rb") }
watch("^test/(.*)/controllers/(.*)_spec.rb") { |m| run("test/controllers/#{m[2]}_spec.rb") }

watch("^(.*)/models/(.*).rb")                { |m| run("test/models/#{m[2]}_spec.rb") }
watch("^test/(.*)/(.*)_spec.rb")             { |m| run("test/models/#{m[2]}_spec.rb") }

watch("test.*/test_helper\.rb")              { run_all }
watch("^test/(.*)_test\.rb")                 { |m| run("test/#{m[1]}_spec.rb") }

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
