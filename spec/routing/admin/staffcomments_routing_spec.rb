require "spec_helper"

describe Admin::StaffcommentsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/staffcomments").should route_to("admin/staffcomments#index")
    end

    it "routes to #new" do
      get("/admin/staffcomments/new").should route_to("admin/staffcomments#new")
    end

    it "routes to #show" do
      get("/admin/staffcomments/1").should route_to("admin/staffcomments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/staffcomments/1/edit").should route_to("admin/staffcomments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/staffcomments").should route_to("admin/staffcomments#create")
    end

    it "routes to #update" do
      put("/admin/staffcomments/1").should route_to("admin/staffcomments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/staffcomments/1").should route_to("admin/staffcomments#destroy", :id => "1")
    end

  end
end
