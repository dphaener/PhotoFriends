require 'spec_helper'

describe "galleries/index" do
  before(:each) do
    assign(:galleries, [
      stub_model(Gallery,
        :name => "Name",
        :archive => "Archive",
        :group => nil
      ),
      stub_model(Gallery,
        :name => "Name",
        :archive => "Archive",
        :group => nil
      )
    ])
  end

  it "renders a list of galleries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Archive".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
