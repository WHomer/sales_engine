require 'rails_helper'

describe do
  describe "GET #index, find single" do
    it "returns http success" do
      m1 = create(:merchant)
      c1 = create(:customer)
      i1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      t1 = create(:transaction, invoice_id: i1.id)
      t2 = create(:transaction, invoice_id: i1.id)
      t3 = create(:transaction, invoice_id: i1.id)

      get "/api/v1/transactions/find?invoice_id=#{i1.id}"

      expect(response).to have_http_status(:success)
      transaction_response = JSON.parse(response.body)["data"]["attributes"]

      expect(transaction_response["id"]).to eq(t1.id)
      expect(transaction_response["invoice_id"]).to eq(t1.invoice_id)
    end
  end

  describe "GET #show, find multiple" do
    it "returns http success" do
      m1 = create(:merchant)
      c1 = create(:customer)
      i1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      t1 = create(:transaction, invoice_id: i1.id)
      t2 = create(:transaction, invoice_id: i1.id)
      t3 = create(:transaction, invoice_id: i1.id)

      get "/api/v1/transactions/find_all?invoice_id=#{i1.id}"
      
      transaction_response = JSON.parse(response.body)["data"]
      expect(transaction_response.count).to eq(3)
      expect(transaction_response.first["attributes"]["id"]).to eq(t1.id)
      expect(transaction_response.first["attributes"]["invoice_id"]).to eq(t1.invoice_id)
    end
  end

end
