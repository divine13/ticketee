require 'spec_helper'

describe "creating a new Project" do
it "it should have the right content" do
  visit new_project_url
  page.should have_selector('h2', text: "New Project" )
  click_link "New Project"

end
end
