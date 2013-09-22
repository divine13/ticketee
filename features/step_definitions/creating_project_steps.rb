Given(/^I am on the homepage$/) do
 visit root_path
end

When(/^I follow "(.*?)"$/) do |arg1|
 click_link "New Project"
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
	fill_in "Name" with: "My Project"
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_content "project has been created"
end
