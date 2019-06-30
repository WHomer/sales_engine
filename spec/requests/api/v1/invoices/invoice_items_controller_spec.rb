require 'rails_helper'

describe do
  describe "GET #index for invoices and return all invoice_items" do
    it "returns http success" do
      merchant = create(:merchant)
      customer = create(:customer)
      invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
      item = create(:item, merchant_id: merchant.id)
      i1 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)
      i2 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)
      i3 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

      new_invoice_items = [i1, i2, i3]

      get "/api/v1/invoices/#{invoice.id}/invoice_items"

      expect(response).to have_http_status(:success)
      invoice_items = JSON.parse(response.body)
      expect(invoice_items["data"].count).to eq(new_invoice_items.count)
    end
  end
end