require 'rails_helper'

describe do
  describe "GET #index" do
    it "returns http success" do
      create_list(:customer, 3)

      get "/api/v1/customers"

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      customer = create(:customer)

      get "/api/v1/customers/#{customer.id}"

      expect(response).to have_http_status(:success)
    end
  end

end
