require 'spec_helper'

describe ProjectsController do	 
  let(:user) do
  	user = FactoryGirl.create(:user)
  	user.confirm!
  	user
 end
 context "standard user" do
   it "it cannot access the new action" do
   sign_in(:user, user)   	
   get :new

   response.should redirect_to(:root_path)
   flash[:alert].should expect("You must be an admin to do that")
     
   end
 end
end