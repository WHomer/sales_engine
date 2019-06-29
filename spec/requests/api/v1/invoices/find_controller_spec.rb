require 'rails_helper'

describe do
  describe "GET #index, find single" do
    it "returns http success" do
      m1 = create(:merchant)
      c1 = create(:customer)
      i1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      i2 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      i3 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)

      get "/api/v1/invoices/find?name=invoice"

      expect(response).to have_http_status(:success)
      invoice_response = JSON.parse(response.body)["data"]["attributes"]

      expect(invoice_response["id"]).to eq(i1.id)
      expect(invoice_response["status"]).to eq(i1.status)
    end
  end

  describe "GET #show, find multiple" do
    it "returns http success" do
      m1 = create(:merchant)
      c1 = create(:customer)
      i1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      i2 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      i3 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)

      get "/api/v1/invoices/find_all"
      
      invoice_response = JSON.parse(response.body)["data"]
      expect(invoice_response.count).to eq(3)
      expect(invoice_response.first["attributes"]["id"]).to eq(i1.id)
      expect(invoice_response.first["attributes"]["status"]).to eq(i1.status)
    end
  end

end
