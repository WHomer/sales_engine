require 'rails_helper'

describe do
  describe "GET #show for invoice_item and return item" do
    it "returns http success" do
      merchant = create(:merchant)
      customer = create(:customer)
      invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
      item = create(:item, merchant_id: merchant.id)
      i1 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)
      i2 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)
      i3 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

      new_invoice_items = [i1, i2, i3]

      get "/api/v1/invoice_items/#{i1.id}/item"

      expect(response).to have_http_status(:success)
      items = JSON.parse(response.body)["data"]["attributes"]
      expect(items["id"]).to eq(item.id)
    end
  end
end