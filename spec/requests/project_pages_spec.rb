require 'spec_helper'

describe "description" do
	subject { page }
describe "home" do
	before{ Factory.create(:project)}
  it "shoule have the projects links" do
    visit_path root_path
    click_link("Tiketee")
  end
end
end