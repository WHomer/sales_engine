require 'rails_helper'

describe do
  describe "GET #index, most revenue" do
    it "returns the top x merchants ranked by total revenue" do
      m1 = create(:merchant)
      m2 = create(:merchant)
      c1 = create(:customer)
      invoice_1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      invoice_2 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      invoice_3 = create(:invoice, merchant_id: m2.id, customer_id: c1.id)
      i1 = create(:item, merchant_id: m1.id)
      i2 = create(:item, merchant_id: m1.id)
      i3 = create(:item, merchant_id: m1.id)
      ii_1 = create(:invoice_item, invoice_id: invoice_1.id, item_id: i1.id)
      ii_2 = create(:invoice_item, invoice_id: invoice_2.id, item_id: i1.id)
      ii_3 = create(:invoice_item, invoice_id: invoice_3.id, item_id: i1.id)
      ii_4 = create(:invoice_item, invoice_id: invoice_1.id, item_id: i1.id)
      ii_5 = create(:invoice_item, invoice_id: invoice_2.id, item_id: i1.id)
      ii_6 = create(:invoice_item, invoice_id: invoice_3.id, item_id: i1.id)
      t1 = create(:transaction, invoice_id: invoice_1.id)
      t2 = create(:transaction, invoice_id: invoice_2.id)
      t3 = create(:transaction, invoice_id: invoice_3.id)

      get "/api/v1/merchants/most_revenue?quantity=2"

      expect(response).to have_http_status(:success)

      results = JSON.parse(response.body)["data"]
      expect(results.count).to eq(2)
    end
  end
end
