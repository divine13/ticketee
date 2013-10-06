require 'spec_helper'

describe UserController do

  describe "GET 'confirmation'" do
    it "returns http success" do
      get 'confirmation'
      response.should be_success
    end
  end

end
