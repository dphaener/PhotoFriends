require 'spec_helper'

describe "photos/new" do
  before(:each) do
    assign(:photo, stub_model(Photo,
      :caption => "MyString",
      :name => "MyString",
      :path => "MyString",
      :gallery => nil
    ).as_new_record)
  end

  it "renders new photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", photos_path, "post" do
      assert_select "input#photo_caption[name=?]", "photo[caption]"
      assert_select "input#photo_name[name=?]", "photo[name]"
      assert_select "input#photo_path[name=?]", "photo[path]"
      assert_select "input#photo_gallery[name=?]", "photo[gallery]"
    end
  end
end
