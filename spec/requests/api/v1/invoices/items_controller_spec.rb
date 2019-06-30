require 'rails_helper'

describe do
  describe "GET #index for invoices and return all items" do
    it "returns http success" do
      merchant = create(:merchant)
      customer = create(:customer)
      invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
      item_1 = create(:item, merchant_id: merchant.id)
      item_2 = create(:item, merchant_id: merchant.id)
      item_3 = create(:item, merchant_id: merchant.id)
      i1 = create(:invoice_item, invoice_id: invoice.id, item_id: item_1.id)
      i2 = create(:invoice_item, invoice_id: invoice.id, item_id: item_2.id)
      i3 = create(:invoice_item, invoice_id: invoice.id, item_id: item_3.id)


      get "/api/v1/invoices/#{invoice.id}/items"

      expect(response).to have_http_status(:success)
      invoice_items = JSON.parse(response.body)
      expect(invoice_items["data"].count).to eq(3)
    end
  end
end