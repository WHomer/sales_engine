require 'rails_helper'

describe do
  describe "GET #index" do
    it "returns http success" do
      merchant = create(:merchant)
      customer = create(:customer)
      invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
      item = create(:item, merchant_id: merchant.id)
      i1 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)
      i2 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)
      i3 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

      new_invoice_items = [i1, i2, i3]

      get "/api/v1/invoice_items"

      expect(response).to have_http_status(:success)
      invoice_items = JSON.parse(response.body)
      expect(invoice_items["data"].count).to eq(new_invoice_items.count)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      merchant = create(:merchant)
      customer = create(:customer)
      invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
      item = create(:item, merchant_id: merchant.id)
      invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

      get "/api/v1/invoice_items/#{invoice_item.id}"
      invoice_item_response = JSON.parse(response.body)["data"]

      expect(response).to have_http_status(:success)
      expect(invoice_item_response["attributes"]["id"]).to eq(invoice_item.id)
      expect(invoice_item_response["attributes"]["item_id"]).to eq(invoice_item.item_id)
      expect(invoice_item_response["attributes"]["invoice_id"]).to eq(invoice_item.invoice_id)
      expect(invoice_item_response["attributes"]["quantity"]).to eq(invoice_item.quantity)
      expect(invoice_item_response["attributes"]["unit_price"]).to eq(invoice_item.unit_price)
    end
  end
end