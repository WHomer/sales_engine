require 'rails_helper'

describe do
  describe "GET #index, find random single" do
    it "returns http success" do
      new_merchants = create_list(:merchant, 3)

      get "/api/v1/merchants/random"

      expect(response).to have_http_status(:success)
    end
  end
end
