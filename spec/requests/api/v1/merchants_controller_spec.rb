require 'rails_helper'

describe do
  describe "GET #index" do
    it "returns http success" do
      new_merchants = create_list(:merchant, 3)

      get "/api/v1/merchants"

      expect(response).to have_http_status(:success)
      merchants = JSON.parse(response.body)
      expect(merchants["data"].count).to eq(new_merchants.count)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      merchant = create(:merchant)

      get "/api/v1/merchants/#{merchant.id}"
      merchant_response = JSON.parse(response.body)["data"]

      expect(response).to have_http_status(:success)
      expect(merchant_response["attributes"]["id"]).to eq(merchant.id)
      expect(merchant_response["attributes"]["name"]).to eq(merchant.name)
    end
  end

end
