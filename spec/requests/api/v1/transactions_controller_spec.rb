require 'rails_helper'

describe do
  describe "GET #index" do
    it "returns http success" do
      m1 = create(:merchant)
      i1 = create(:item, merchant_id: m1.id)
      i2 = create(:item, merchant_id: m1.id)
      i3 = create(:item, merchant_id: m1.id)

      new_items = [i1, i2, i3]

      get "/api/v1/items"

      expect(response).to have_http_status(:success)
      items = JSON.parse(response.body)
      expect(items["data"].count).to eq(new_items.count)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      m1 = create(:merchant)
      item = create(:item, merchant_id: m1.id)

      get "/api/v1/items/#{item.id}"
      item_response = JSON.parse(response.body)["data"]

      expect(response).to have_http_status(:success)
      expect(item_response["attributes"]["id"]).to eq(item.id)
      expect(item_response["attributes"]["name"]).to eq(item.name)
      expect(item_response["attributes"]["description"]).to eq(item.description)
      expect(item_response["attributes"]["unit_price"]).to eq(item.unit_price)
      expect(item_response["attributes"]["merchant_id"]).to eq(item.merchant_id)
    end
  end

end
