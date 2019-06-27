require 'rails_helper'

describe do
  describe "GET #index" do
    it "returns http success" do
      m1 = create(:merchant)
      c1 = create(:customer)
      i1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      i2 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      i3 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)

      new_invoices = [i1, i2, i3]

      get "/api/v1/invoices"

      expect(response).to have_http_status(:success)
      invoices = JSON.parse(response.body)
      expect(invoices["data"].count).to eq(new_invoices.count)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      m1 = create(:merchant)
      c1 = create(:customer)
      invoice = create(:invoice, merchant_id: m1.id, customer_id: c1.id)

      get "/api/v1/invoices/#{invoice.id}"
      invoice_response = JSON.parse(response.body)["data"]

      expect(response).to have_http_status(:success)
      expect(invoice_response["attributes"]["id"]).to eq(invoice.id)
      expect(invoice_response["attributes"]["customer_id"]).to eq(invoice.customer_id)
      expect(invoice_response["attributes"]["merchant_id"]).to eq(invoice.merchant_id)
      expect(invoice_response["attributes"]["status"]).to eq(invoice.status)
    end
  end

end
