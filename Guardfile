# gem install guard guard-minitest
# https://github.com/guard/guard#readme

guard 'minitest' do
  watch(%r{^app/(.+)\.rb$})   { |m| "test/app/#{m[1]}_test.rb" }
  watch(%r{^lib/(.+)\.rb$})   { |m| "test/lib/#{m[1]}_test.rb" }
  watch(%r{^test/(.+)\.rb$})  { |m| "test/#{m[1]}.rb" }
end
