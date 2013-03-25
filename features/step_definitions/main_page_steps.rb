Given /^I am viewing "(.+)"$/ do |url|
    visit(url)
end
 
Then /^I should see a link to "(.*?)" called "(.*?)"$/ do |url, text|
  response_body.should have_selector("a[href='#{ url }']") do |element|
    element.should contain(text)
  end
end
