require 'spec_helper'

describe SessionsController do
  let(:valid_attributes) { { :email => "MyString", :username => "MyString", :password => "abc123", :password_confirmation => "abc123", :id => 1 } }
  
  let(:valid_params) { { :credential_name => "MyString" } }
  
  describe "#new" do
    it "redirects to the new session page" do
      get :new
      response.should be_successful
      response.should render_template("new")
    end
  end
  
  describe "#create" do
    context "user is authenticated, has no groups" do
      it "redirects to new groups page" do
        user = User.create! valid_attributes
        post :create, :credential_name => "MyString", :password => "abc123"
        response.should redirect_to(user_groups_path(1))
      end
    end
  end
end
