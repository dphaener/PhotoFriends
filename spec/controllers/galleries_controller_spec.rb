require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe GalleriesController do

  # This should return the minimal set of attributes required to create a valid
  # Gallery. As you add validations to Gallery, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString", archive: "1", group_id: "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GalleriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  
  let(:user) { User.create!( email: 'test@test.com', username: 'test', password: 'abc123', password_confirmation: 'abc123') }
  
  let(:group) { Group.create!( owner: "1", name: "MyGroup", password: "abc123", password_confirmation: "abc123") }

  describe "GET index" do
    it "assigns all galleries as @galleries" do
      gallery = Gallery.create! valid_attributes
      get :index, { user_id: user.to_param, group_id: group.to_param }, valid_session
      assigns(:galleries).should eq([gallery])
    end
  end

  describe "GET show" do
    it "assigns the requested gallery as @gallery" do
      gallery = Gallery.create! valid_attributes
      get :show, {:id => gallery.to_param, user_id: user.to_param, group_id: group.to_param }, valid_session
      assigns(:gallery).should eq(gallery)
    end
  end

  describe "GET new" do
    it "assigns a new gallery as @gallery" do
      get :new, { user_id: user.to_param, group_id: group.to_param }, valid_session
      assigns(:gallery).should be_a_new(Gallery)
    end
  end

  describe "GET edit" do
    it "assigns the requested gallery as @gallery" do
      gallery = Gallery.create! valid_attributes
      get :edit, {:id => gallery.to_param, user_id: user.to_param, group_id: group.to_param }, valid_session
      assigns(:gallery).should eq(gallery)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Gallery" do
        expect {
          post :create, {:gallery => valid_attributes, user_id: user.to_param, group_id: group.to_param }, valid_session
        }.to change(Gallery, :count).by(1)
      end

      it "assigns a newly created gallery as @gallery" do
        post :create, {:gallery => valid_attributes, user_id: user.to_param, group_id: group.to_param }, valid_session
        assigns(:gallery).should be_a(Gallery)
        assigns(:gallery).should be_persisted
      end

      it "redirects to the groups home page" do
        post :create, {:gallery => valid_attributes, user_id: user.to_param, group_id: group.to_param }, valid_session
        response.should redirect_to(user_groups_path(user_id: user.to_param))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved gallery as @gallery" do
        # Trigger the behavior that occurs when invalid params are submitted
        Gallery.any_instance.stub(:save).and_return(false)
        post :create, {:gallery => { "name" => "invalid value" }, user_id: user.to_param, group_id: group.to_param }, valid_session
        assigns(:gallery).should be_a_new(Gallery)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Gallery.any_instance.stub(:save).and_return(false)
        post :create, {:gallery => { "name" => "invalid value" }, user_id: user.to_param, group_id: group.to_param }, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested gallery" do
        gallery = Gallery.create! valid_attributes
        # Assuming there are no other galleries in the database, this
        # specifies that the Gallery created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Gallery.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => gallery.to_param, :gallery => { "name" => "MyString" }, user_id: user.to_param, group_id: group.to_param }, valid_session
      end

      it "assigns the requested gallery as @gallery" do
        gallery = Gallery.create! valid_attributes
        put :update, {:id => gallery.to_param, :gallery => valid_attributes, user_id: user.to_param, group_id: group.to_param }, valid_session
        assigns(:gallery).should eq(gallery)
      end

      it "redirects to the gallery" do
        gallery = Gallery.create! valid_attributes
        put :update, {:id => gallery.to_param, :gallery => valid_attributes, user_id: user.to_param, group_id: group.to_param }, valid_session
        response.should redirect_to(user_group_gallery_path(user.to_param, group.to_param, id: gallery.to_param))
      end
    end

    describe "with invalid params" do
      it "assigns the gallery as @gallery" do
        gallery = Gallery.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Gallery.any_instance.stub(:save).and_return(false)
        put :update, {:id => gallery.to_param, :gallery => { "name" => "invalid value" }, user_id: user.to_param, group_id: group.to_param }, valid_session
        assigns(:gallery).should eq(gallery)
      end

      it "re-renders the 'edit' template" do
        gallery = Gallery.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Gallery.any_instance.stub(:save).and_return(false)
        put :update, {:id => gallery.to_param, :gallery => { "name" => "invalid value" }, user_id: user.to_param, group_id: group.to_param }, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested gallery" do
      gallery = Gallery.create! valid_attributes
      expect {
        delete :destroy, {:id => gallery.to_param, user_id: user.to_param, group_id: group.to_param }, valid_session
      }.to change(Gallery, :count).by(-1)
    end

    it "redirects to the galleries list" do
      gallery = Gallery.create! valid_attributes
      delete :destroy, {:id => gallery.to_param, user_id: user.to_param, group_id: group.to_param }, valid_session
      response.should redirect_to(user_group_galleries_path(user_id: user.to_param, group_id: group.to_param))
    end
  end

end
