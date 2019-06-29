require 'rails_helper'

describe do
  describe "GET #index, find random single" do
    it "returns http success" do
      m1 = create(:merchant)
      c1 = create(:customer)
      i1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      i2 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      i3 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)

      get "/api/v1/invoices/random"

      expect(response).to have_http_status(:success)
    end
  end
end
