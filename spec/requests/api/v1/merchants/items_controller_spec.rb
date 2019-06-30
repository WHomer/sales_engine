require 'rails_helper'

describe do
  describe "GET #index, return all items for a single merchant" do
    it "returns http success" do
      m1 = create(:merchant)
      c1 = create(:customer)
      invoice_1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      invoice_2 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      invoice_3 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      i1 = create(:item, merchant_id: m1.id)
      i2 = create(:item, merchant_id: m1.id)
      i3 = create(:item, merchant_id: m1.id)

      get "/api/v1/merchants/#{m1.id}/items"

      expect(response).to have_http_status(:success)

      items = JSON.parse(response.body)["data"]
      expect(items.count).to eq(3)
      expect(items[0]["attributes"]["id"]).to eq(i1.id)
      expect(items[0]["attributes"]["name"]).to eq(i1.name)
      expect(items[0]["attributes"]["description"]).to eq(i1.description)
      expect(items[0]["attributes"]["unit_price"]).to eq(i1.unit_price)
      expect(items[0]["attributes"]["merchant_id"]).to eq(i1.merchant_id)

    end
  end
end
