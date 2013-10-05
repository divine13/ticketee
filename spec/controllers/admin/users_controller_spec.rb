require 'spec_helper'

describe Admin::UsersController do

  let(:user) do
  user = FactoryGirl.create(:user)
  user.confirm!
  user
  end
  context "restrictions" do
  	before { sign_in(user)}

    it "should not allow users who are admin to access this action" do
  get :index 
  response.should redirect_to(root_path)
  flash[:alert].should eql("You are not allowd to view this page")
end
  end
end
