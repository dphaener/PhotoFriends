require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :email => "Email",
        :username => "Username",
        :password_hash => "Password Hash",
        :password_salt => "Password Salt",
        :avatar => "Avatar",
        :userlevel => 1,
        :group => nil
      ),
      stub_model(User,
        :email => "Email",
        :username => "Username",
        :password_hash => "Password Hash",
        :password_salt => "Password Salt",
        :avatar => "Avatar",
        :userlevel => 1,
        :group => nil
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password Hash".to_s, :count => 2
    assert_select "tr>td", :text => "Password Salt".to_s, :count => 2
    assert_select "tr>td", :text => "Avatar".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
