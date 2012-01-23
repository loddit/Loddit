Given /^There are articles titled (.+)$/ do |titles|
  titles.split(',').each do |title|
    Article.create(:title => title,:body => "content of #{title}")
  end
end

When /^I go to the list of articles$/ do 
  visit articles_url
end

When /^I go to article titled (\w+)$/ do |title|
  visit url_for(Article.where(:title => title).first)
end

Then /^I should read article titled (\w+)$/ do |title|
  article = Article.where(:title => title).first
  page.should have_content(article.title)
  page.should have_content(article.body)
end
