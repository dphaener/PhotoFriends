require 'spec_helper'

describe SessionsController do
  let(:valid_attributes) { { :email => "MyString", :username => "MyString", :password => "abc123", :password_confirmation => "abc123", :id => 1 } }
  
  let(:valid_group_attributes) { { owner: "1", name: "MyGroup", password: "abc123", password_confirmation: "abc123" } }
  
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
        post :create, :session => { :credential_name => "MyString", :password => "abc123" }
        response.should redirect_to(user_groups_path(user.to_param))
      end
    end
    
    context 'user is authenticated, has groups' do
      it 'redirects to last updated group page' do
        user = User.create! valid_attributes
        group = Group.create! valid_group_attributes
        usergroup = GroupsAndUsers.create!(user_id: user.to_param, group_id: group.to_param)
        post :create, :session => { :credential_name => "MyString", :password => "abc123" }
        response.should redirect_to(user_group_path(user.to_param, group.to_param))
      end
    end
  end
end
