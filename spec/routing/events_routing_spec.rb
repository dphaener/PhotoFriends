require "spec_helper"

describe EventsController do
  describe "routing" do

    it "routes to #index" do
      get("users/1/groups/1/events").should route_to("events#index", user_id: "1", group_id: "1")
    end

    it "routes to #new" do
      get("users/1/groups/1/events/new").should route_to("events#new", user_id: "1", group_id: "1")
    end

    it "routes to #show" do
      get("users/1/groups/1/events/1").should route_to("events#show", :id => "1", user_id: "1", group_id: "1")
    end

    it "routes to #edit" do
      get("users/1/groups/1/events/1/edit").should route_to("events#edit", :id => "1", user_id: "1", group_id: "1")
    end

    it "routes to #create" do
      post("users/1/groups/1/events").should route_to("events#create", user_id: "1", group_id: "1")
    end

    it "routes to #update" do
      put("users/1/groups/1/events/1").should route_to("events#update", :id => "1", user_id: "1", group_id: "1")
    end

    it "routes to #destroy" do
      delete("users/1/groups/1/events/1").should route_to("events#destroy", :id => "1", user_id: "1", group_id: "1")
    end

  end
end
