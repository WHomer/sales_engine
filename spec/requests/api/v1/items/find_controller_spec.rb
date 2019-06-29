require 'rails_helper'

describe do
  describe "GET #index, find single" do
    it "returns http success" do
      m1 = create(:merchant)
      i1 = create(:item, name: 'new_item', merchant_id: m1.id)
      i2 = create(:item, merchant_id: m1.id)
      i3 = create(:item, merchant_id: m1.id)

      get "/api/v1/items/find?name=new_item"

      expect(response).to have_http_status(:success)

      item_response = JSON.parse(response.body)["data"]["attributes"]
      expect(item_response["id"]).to eq(i1.id)
      expect(item_response["name"]).to eq(i1.name)
    end
  end

  describe "GET #show, find multiple" do
    it "returns http success" do
      m1 = create(:merchant)
      i1 = create(:item, name: 'new_item', merchant_id: m1.id)
      i2 = create(:item, merchant_id: m1.id)
      i3 = create(:item, merchant_id: m1.id)

      get "/api/v1/items/find_all"
      
      item_response = JSON.parse(response.body)["data"]
      expect(item_response.count).to eq(3)
      expect(item_response.first["attributes"]["id"]).to eq(i1.id)
      expect(item_response.first["attributes"]["name"]).to eq(i1.name)
    end
  end

end
