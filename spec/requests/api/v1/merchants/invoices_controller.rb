require 'rails_helper'

describe do
  describe "GET #index, return all invoices for a single merchant" do
    it "returns http success" do
      m1 = create(:merchant)
      c1 = create(:customer)
      invoice_1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      invoice_2 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      invoice_3 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      item = create(:item, merchant_id: m1.id)

      i1 = create(:invoice_item, invoice_id: invoice_1.id, item_id: item.id)
      i2 = create(:invoice_item, invoice_id: invoice_1.id, item_id: item.id)
      i3 = create(:invoice_item, invoice_id: invoice_1.id, item_id: item.id)

      get "/api/v1/merchants/#{m1.id}/invoices"

      expect(response).to have_http_status(:success)

      invoices = JSON.parse(response.body)["data"]
      expect(invoices.count).to eq(3)
      expect(invoices[0]["attributes"]["id"]).to eq(invoice_1.id)
      expect(invoices[0]["attributes"]["customer_id"]).to eq(invoice_1.customer_id)
      expect(invoices[0]["attributes"]["merchant_id"]).to eq(invoice_1.merchant_id)
      expect(invoices[0]["attributes"]["status"]).to eq(invoice_1.status)
      expect(invoices[1]["attributes"]["id"]).to eq(invoice_2.id)
      expect(invoices[1]["attributes"]["customer_id"]).to eq(invoice_2.customer_id)
      expect(invoices[1]["attributes"]["merchant_id"]).to eq(invoice_2.merchant_id)
      expect(invoices[1]["attributes"]["status"]).to eq(invoice_2.status)
      expect(invoices[2]["attributes"]["id"]).to eq(invoice_3.id)
      expect(invoices[2]["attributes"]["customer_id"]).to eq(invoice_3.customer_id)
      expect(invoices[2]["attributes"]["merchant_id"]).to eq(invoice_3.merchant_id)
      expect(invoices[2]["attributes"]["status"]).to eq(invoice_3.status)
    end
  end
end
