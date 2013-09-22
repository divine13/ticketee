require 'spec_helper'

describe "ProjectPages" do
	subject { page }
  describe "home page" do
    before{ visit root_path}
    before { click_link("New Projects") }

    it {should have_content("New Project") }
  end
end
