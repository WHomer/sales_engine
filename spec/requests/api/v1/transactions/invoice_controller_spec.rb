require 'rails_helper'

describe do
  describe "GET #show for transactions and return invoice" do
    it "returns http success" do
      merchant = create(:merchant)
      customer = create(:customer)
      invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
      item_1 = create(:item, merchant_id: merchant.id)
      item_2 = create(:item, merchant_id: merchant.id)
      item_3 = create(:item, merchant_id: merchant.id)
      i1 = create(:invoice_item, invoice_id: invoice.id, item_id: item_1.id)
      i2 = create(:invoice_item, invoice_id: invoice.id, item_id: item_2.id)
      i3 = create(:invoice_item, invoice_id: invoice.id, item_id: item_3.id)
      t1 = create(:transaction, invoice_id: invoice.id)
      t2 = create(:transaction, invoice_id: invoice.id)
      t3 = create(:transaction, invoice_id: invoice.id)

      get "/api/v1/transactions/#{t1.id}/invoice"

      expect(response).to have_http_status(:success)
      invoices = JSON.parse(response.body)["data"]["attributes"]
      expect(invoices["id"]).to eq(invoice.id)
    end
  end
end