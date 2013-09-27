require "spec_helper"

describe PhotosController do
  describe "routing" do

    it "routes to #index" do
      get("/users/1/groups/1/galleries/1/photos").should route_to("photos#index", user_id: "1", group_id: "1", gallery_id: "1")
    end

    it "routes to #new" do
      get("/users/1/groups/1/galleries/1/photos/new").should route_to("photos#new", user_id: "1", group_id: "1", gallery_id: "1")
    end

    it "routes to #show" do
      get("/users/1/groups/1/galleries/1/photos/1").should route_to("photos#show", :id => "1", user_id: "1", group_id: "1", gallery_id: "1")
    end

    it "routes to #edit" do
      get("/users/1/groups/1/galleries/1/photos/1/edit").should route_to("photos#edit", :id => "1", user_id: "1", group_id: "1", gallery_id: "1")
    end

    it "routes to #create" do
      post("/users/1/groups/1/galleries/1/photos").should route_to("photos#create", user_id: "1", group_id: "1", gallery_id: "1")
    end

    it "routes to #update" do
      put("/users/1/groups/1/galleries/1/photos/1").should route_to("photos#update", :id => "1", user_id: "1", group_id: "1", gallery_id: "1")
    end

    it "routes to #destroy" do
      delete("/users/1/groups/1/galleries/1/photos/1").should route_to("photos#destroy", :id => "1", user_id: "1", group_id: "1", gallery_id: "1")
    end

  end
end
