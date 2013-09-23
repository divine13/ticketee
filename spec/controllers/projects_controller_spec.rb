require 'spec_helper'

describe ProjectsController do
	it "should redirect when to home when page not there" do
		get :show, id: "someotherpage"
		response.should redirect_to(root_path)
		alert_msg = "Sorry!, The page you are looking for is not available"
		flash[:alert].should eql(alert_msg)
	  
	end
end
