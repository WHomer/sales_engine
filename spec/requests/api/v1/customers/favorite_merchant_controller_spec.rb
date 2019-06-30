require 'rails_helper'

describe do
  describe "GET #show, return merchant for a single customer" do
    it "returns returns a merchant where the customer has conducted the most successful transactions" do
      m1 = create(:merchant)
      m2 = create(:merchant)
      m3 = create(:merchant)
      c1 = create(:customer)
      invoice_1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      invoice_2 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      invoice_3 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      invoice_4 = create(:invoice, merchant_id: m2.id, customer_id: c1.id)
      t1 = create(:transaction, invoice_id: invoice_1.id)
      t2 = create(:transaction, invoice_id: invoice_2.id)
      t3 = create(:transaction, invoice_id: invoice_3.id, result: "failed")
      t4 = create(:transaction, invoice_id: invoice_4.id)
      item = create(:item, merchant_id: m1.id)
      i1 = create(:invoice_item, invoice_id: invoice_1.id, item_id: item.id)
      i2 = create(:invoice_item, invoice_id: invoice_1.id, item_id: item.id)
      i3 = create(:invoice_item, invoice_id: invoice_1.id, item_id: item.id)

      get "/api/v1/customers/#{c1.id}/favorite_merchant"

      expect(response).to have_http_status(:success)

      merchants = JSON.parse(response.body)["data"]
      expect(merchants[0]["attributes"]["id"]).to eq(m1.id)
      expect(merchants[0]["attributes"]["name"]).to eq(m1.name)
    end
  end
end
