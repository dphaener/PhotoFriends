require "spec_helper"

describe CommentsController do
  describe "routing" do

    it "routes to #index" do
      get("/users/1/groups/1/galleries/1/comments").should route_to("comments#index", user_id: "1", group_id: "1", gallery_id: "1")
    end

    it "routes to #new" do
      get("/users/1/groups/1/galleries/1/comments/new").should route_to("comments#new", user_id: "1", group_id: "1", gallery_id: "1")
    end

    it "routes to #show" do
      get("/users/1/groups/1/galleries/1/comments/1").should route_to("comments#show", :id => "1", user_id: "1", group_id: "1", gallery_id: "1")
    end

    it "routes to #edit" do
      get("/users/1/groups/1/galleries/1/comments/1/edit").should route_to("comments#edit", :id => "1", user_id: "1", group_id: "1", gallery_id: "1")
    end

    it "routes to #create" do
      post("/users/1/groups/1/galleries/1/comments").should route_to("comments#create", user_id: "1", group_id: "1", gallery_id: "1")
    end

    it "routes to #update" do
      put("/users/1/groups/1/galleries/1/comments/1").should route_to("comments#update", :id => "1", user_id: "1", group_id: "1", gallery_id: "1")
    end

    it "routes to #destroy" do
      delete("/users/1/groups/1/galleries/1/comments/1").should route_to("comments#destroy", :id => "1", user_id: "1", group_id: "1", gallery_id: "1")
    end

  end
end
