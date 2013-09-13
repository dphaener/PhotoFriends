require 'spec_helper'

describe "photos/index" do
  before(:each) do
    assign(:photos, [
      stub_model(Photo,
        :caption => "Caption",
        :name => "Name",
        :path => "Path",
        :gallery => nil
      ),
      stub_model(Photo,
        :caption => "Caption",
        :name => "Name",
        :path => "Path",
        :gallery => nil
      )
    ])
  end

  it "renders a list of photos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Caption".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Path".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
