require 'rails_helper'

describe do
  describe "GET #index, find random single" do
    it "returns http success" do
      m1 = create(:merchant)
      create(:item, merchant_id: m1.id)
      create(:item, merchant_id: m1.id)
      create(:item, merchant_id: m1.id)

      get "/api/v1/items/random"

      expect(response).to have_http_status(:success)
    end
  end
end
