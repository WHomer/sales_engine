require 'rails_helper'

describe do
  describe "GET #show of merchant by invoice" do
    it "returns http success" do
      m1 = create(:merchant)
      m2 = create(:merchant)
      m3 = create(:merchant)
      c1 = create(:customer)
      i1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      i2 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      i3 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)

      new_invoices = [i1, i2, i3]

      get "/api/v1/invoices/#{i1.id}/merchant"

      expect(response).to have_http_status(:success)
      merchant = JSON.parse(response.body)["data"]["attributes"]

      expect(merchant["id"]).to eq(m1.id)
      expect(merchant["name"]).to eq(m1.name)
    end
  end
end
