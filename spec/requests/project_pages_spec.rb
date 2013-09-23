require 'spec_helper'

describe "creating a new Project" do
it "it should have the right content" do
  visit new_project_url
  page.should have_selector('h2', text: "New Project" )
end
end

describe "when filing in name " do
	before {Factory.create(:project)}
  it { should be_valid}
  it { should have_content("project has been succesfuly created")}
end