require 'rails_helper'

describe do
  describe "GET #index, find single" do
    it "returns http success" do
      new_merchants = create_list(:merchant, 3)

      get "/api/v1/merchants/find?name=merchant"

      expect(response).to have_http_status(:success)
      merchant_response = JSON.parse(response.body)["data"]["attributes"]

      expect(merchant_response["id"]).to eq(new_merchants.first.id)
      expect(merchant_response["name"]).to eq(new_merchants.first.name)
    end
  end

  describe "GET #show, find multiple" do
    it "returns http success" do
      new_merchants = create_list(:merchant, 3)

      get "/api/v1/merchants/find_all"
      
      merchant_response = JSON.parse(response.body)["data"]
      expect(merchant_response.count).to eq(3)
      expect(merchant_response.first["attributes"]["id"]).to eq(new_merchants.first.id)
      expect(merchant_response.first["attributes"]["name"]).to eq(new_merchants.first.name)
    end
  end

end
