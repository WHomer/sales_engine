require 'rails_helper'

describe do
  describe "GET #index, find single" do
    it "returns http success" do
      m1 = create(:merchant)
      c1 = create(:customer)
      invoice = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      item = create(:item, merchant_id: m1.id)

      i1 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)
      i2 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)
      i3 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

      get "/api/v1/invoice_items/find?item_id=#{item.id}"

      expect(response).to have_http_status(:success)
      invoice_item_response = JSON.parse(response.body)["data"]["attributes"]

      expect(invoice_item_response["id"]).to eq(i1.id)
      expect(invoice_item_response["quantity"]).to eq(i1.quantity)
    end
  end

  describe "GET #show, find multiple" do
    it "returns http success" do
     m1 = create(:merchant)
      c1 = create(:customer)
      invoice = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      item = create(:item, merchant_id: m1.id)

      i1 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)
      i2 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)
      i3 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

      get "/api/v1/invoice_items/find_all?item_id=#{item.id}"
      
      invoice_item_response = JSON.parse(response.body)["data"]
      expect(invoice_item_response.count).to eq(3)
      expect(invoice_item_response.first["attributes"]["id"]).to eq(i1.id)
      expect(invoice_item_response.first["attributes"]["quantity"]).to eq(i1.quantity)
    end
  end

end
