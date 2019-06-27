require 'rails_helper'

describe do
  describe "GET #index" do
    it "returns http success" do
      new_customers = create_list(:customer, 3)

      get "/api/v1/customers"

      expect(response).to have_http_status(:success)
      customers = JSON.parse(response.body)
      expect(customers["data"].count).to eq(new_customers.count)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      customer = create(:customer)

      get "/api/v1/customers/#{customer.id}"
      customer_response = JSON.parse(response.body)["data"]

      expect(response).to have_http_status(:success)
      expect(customer_response["attributes"]["id"]).to eq(customer.id)
      expect(customer_response["attributes"]["first_name"]).to eq(customer.first_name)
      expect(customer_response["attributes"]["last_name"]).to eq(customer.last_name)
    end
  end

end
