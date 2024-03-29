Given(/^I am on the homepage$/) do
 
end 

 When(/^I follow "(.*?)"$/) do |arg1|
    visit new_project_url
 end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
	page.fill_in arg1, with: arg2
end

When(/^I click button "(.*?)"$/) do |arg1|
	page.click_button(arg1)
end

 # Then(/^I should see "(.*?)"$/) do |arg1|
 #   page.should have_content arg1
 # end

Given(/^there is a project called "(.*?)"$/) do |name|
  FactoryGirl.create(:project, name: name)
end

Given(/^I am at the home page$/) do

end

Then(/^I should be on the project page for "(.*?)"$/) do |arg1|
 page.should have_content(arg1)
end

When(/^I press "(.*?)"$/) do |arg1|
	page.click_button(arg1)
end

Then(/^I should see "(.*?)"$/) do |arg1|
	page.should have_content(arg1)
end