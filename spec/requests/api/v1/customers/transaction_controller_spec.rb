require 'rails_helper'

describe do
  describe "GET #index, return all transactions for a single customer" do
    it "returns http success" do
      m1 = create(:merchant)
      c1 = create(:customer)
      invoice_1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      invoice_2 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
      invoice_3 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)

      t1 = create(:transaction, invoice_id: invoice_1.id)
      t2 = create(:transaction, invoice_id: invoice_2.id)
      t3 = create(:transaction, invoice_id: invoice_3.id)

      item = create(:item, merchant_id: m1.id)

      i1 = create(:invoice_item, invoice_id: invoice_1.id, item_id: item.id)
      i2 = create(:invoice_item, invoice_id: invoice_1.id, item_id: item.id)
      i3 = create(:invoice_item, invoice_id: invoice_1.id, item_id: item.id)

      get "/api/v1/customers/#{c1.id}/transactions"

      expect(response).to have_http_status(:success)

      transactions = JSON.parse(response.body)["data"]
      expect(transactions.count).to eq(3)
      expect(transactions[0]["attributes"]["id"]).to eq(t1.id)
      expect(transactions[0]["attributes"]["invoice_id"]).to eq(t1.invoice_id)
      expect(transactions[0]["attributes"]["credit_card_number"]).to eq(t1.credit_card_number)
      expect(transactions[0]["attributes"]["credit_card_expiration_date"]).to eq(t1.credit_card_expiration_date)
      expect(transactions[0]["attributes"]["result"]).to eq(t1.result)

    end
  end
end
