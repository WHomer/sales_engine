require 'rails_helper'

describe do
  describe "GET #show of customer by invoice" do
    it "returns http success" do
      m1 = create(:merchant)
      m2 = create(:merchant)
      m3 = create(:merchant)
      c1 = create(:customer)
      i1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      i2 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      i3 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)

      new_invoices = [i1, i2, i3]

      get "/api/v1/invoices/#{i1.id}/customer"

      expect(response).to have_http_status(:success)
      customer = JSON.parse(response.body)["data"]["attributes"]

      expect(customer["id"]).to eq(c1.id)
      expect(customer["first_name"]).to eq(c1.first_name)
      expect(customer["last_name"]).to eq(c1.last_name)
    end
  end
end
