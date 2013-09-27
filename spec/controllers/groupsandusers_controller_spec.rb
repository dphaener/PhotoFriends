require 'spec_helper'

describe GroupsandusersController do
  
  # This should return the minimal set of attributes required to create a valid
  # Group. As you add validations to Group, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { owner: "1", name: "MyGroup", password: "abc123", password_confirmation: "abc123" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GroupsController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  
  let(:user) { User.create!( email: 'test@test.com', username: 'test', password: 'abc123', password_confirmation: 'abc123') }
  
  describe "GET 'new'" do
    it "returns http success" do
      get 'new', user_id: user.to_param
      response.should be_success
    end
  end
  
  describe '#create' do
    context 'user has invalid group credentials' do
      it 'redraws the page with an error message' do
        group = Group.create! valid_attributes
        get :create, { user_id: user.to_param, group: { password: "abc246", password_confirmation: "abc246", name: "MyGroup" } }
        @group.should eq nil
      end
    end
    
    context 'user has valid credentials' do
      it 'creates a new row in the GroupsAndUsers database containing user_id and group_id' do
        group = Group.create! valid_attributes
        expect {
          get :create, { user_id: user.to_param, group: valid_attributes }
        }.to change(GroupsAndUsers, :count).by(1)
      end
    end
  end

end
