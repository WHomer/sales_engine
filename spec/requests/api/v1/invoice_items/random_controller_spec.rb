require 'rails_helper'

describe do
  describe "GET #show, find random single" do
    it "returns http success" do
      m1 = create(:merchant)
      c1 = create(:customer)
      invoice = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      item = create(:item, merchant_id: m1.id)

      i1 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)
      i2 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)
      i3 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

      get "/api/v1/invoice_items/random"

      expect(response).to have_http_status(:success)
    end
  end
end
