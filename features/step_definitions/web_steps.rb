Then /^I should see (\w+)$/ do |something|
  page.should have_content(something)
end

