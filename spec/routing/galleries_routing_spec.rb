require "spec_helper"

describe GalleriesController do
  describe "routing" do

    it "routes to #index" do
      get("users/1/groups/1/galleries").should route_to("galleries#index", :user_id => "1", :group_id => "1")
    end

    it "routes to #new" do
      get("users/1/groups/1/galleries/new").should route_to("galleries#new", :user_id => "1", :group_id => "1")
    end

    it "routes to #show" do
      get("users/1/groups/1/galleries/1").should route_to("galleries#show", :id => "1", :user_id => "1", :group_id => "1")
    end

    it "routes to #edit" do
      get("users/1/groups/1/galleries/1/edit").should route_to("galleries#edit", :id => "1", :user_id => "1", :group_id => "1")
    end

    it "routes to #create" do
      post("users/1/groups/1/galleries").should route_to("galleries#create", :user_id => "1", :group_id => "1")
    end

    it "routes to #update" do
      put("users/1/groups/1/galleries/1").should route_to("galleries#update", :id => "1", :user_id => "1", :group_id => "1")
    end

    it "routes to #destroy" do
      delete("users/1/groups/1/galleries/1").should route_to("galleries#destroy", :id => "1", :user_id => "1", :group_id => "1")
    end

  end
end
