require 'rails_helper'

RSpec.describe "Mains", type: :request do
  describe "GET /user" do
    it "returns http success" do
      get "/main/user"
      expect(response).to have_http_status(:success)
    end
  end

end
