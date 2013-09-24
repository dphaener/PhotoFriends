require "spec_helper"

describe GroupsController do
  describe "routing" do

    it "routes to #new" do
      get("/users/1/groups/new").should route_to("groups#new", :user_id => "1")
    end

    it "routes to #show" do
      get("/users/1/groups/1").should route_to("groups#show", :id => "1", :user_id => "1")
    end

    it "routes to #edit" do
      get("/users/1/groups/1/edit").should route_to("groups#edit", :id => "1", :user_id => "1")
    end

    it "routes to #create" do
      post("/users/1/groups").should route_to("groups#create", :user_id => "1")
    end

    it "routes to #update" do
      put("/users/1/groups/1").should route_to("groups#update", :id => "1", :user_id => "1")
    end

    it "routes to #destroy" do
      delete("/users/1/groups/1").should route_to("groups#destroy", :id => "1", :user_id => "1")
    end

  end
end
