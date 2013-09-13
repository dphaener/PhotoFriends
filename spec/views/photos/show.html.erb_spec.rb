require 'spec_helper'

describe "photos/show" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :caption => "Caption",
      :name => "Name",
      :path => "Path",
      :gallery => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Caption/)
    rendered.should match(/Name/)
    rendered.should match(/Path/)
    rendered.should match(//)
  end
end
