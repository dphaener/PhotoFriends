require 'spec_helper'

describe "photos/edit" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :caption => "MyString",
      :name => "MyString",
      :path => "MyString",
      :gallery => nil
    ))
  end

  it "renders the edit photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", photo_path(@photo), "post" do
      assert_select "input#photo_caption[name=?]", "photo[caption]"
      assert_select "input#photo_name[name=?]", "photo[name]"
      assert_select "input#photo_path[name=?]", "photo[path]"
      assert_select "input#photo_gallery[name=?]", "photo[gallery]"
    end
  end
end
