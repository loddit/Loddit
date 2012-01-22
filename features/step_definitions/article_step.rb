Given /^There are articles titled (.+)$/ do |titles|
  titles.split(',').each do |title|
    Article.create(:title => title,:body => "content of #{title}")
  end
end
