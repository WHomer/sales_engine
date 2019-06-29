require 'rails_helper'

describe do
  describe "GET #index, find random single" do
    it "returns http success" do
      m1 = create(:merchant)
      c1 = create(:customer)
      i1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      t1 = create(:transaction, invoice_id: i1.id)
      t2 = create(:transaction, invoice_id: i1.id)
      t3 = create(:transaction, invoice_id: i1.id)

      get "/api/v1/transactions/random"

      expect(response).to have_http_status(:success)
    end
  end
end
