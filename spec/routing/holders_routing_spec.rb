require "rails_helper"

RSpec.describe HoldersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/holders").to route_to("holders#index")
    end

    it "routes to #new" do
      expect(get: "/holders/new").to route_to("holders#new")
    end

    it "routes to #show" do
      expect(get: "/holders/1").to route_to("holders#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/holders/1/edit").to route_to("holders#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/holders").to route_to("holders#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/holders/1").to route_to("holders#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/holders/1").to route_to("holders#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/holders/1").to route_to("holders#destroy", id: "1")
    end
  end
end
