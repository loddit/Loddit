When /^I go to the list of (\w+)$/ do |items|
  visit "/#{items}"
end

Then /^I should see (\w+)$/ do |something|
  page.should have_content(something)
end
