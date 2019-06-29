require 'rails_helper'

describe do
  describe "GET #index, find single" do
    it "returns http success" do
      new_customers = create_list(:customer, 3)

      get "/api/v1/customers/find?name=customer"

      expect(response).to have_http_status(:success)
      customer_response = JSON.parse(response.body)["data"]["attributes"]

      expect(customer_response["id"]).to eq(new_customers.first.id)
      expect(customer_response["first_name"]).to eq(new_customers.first.first_name)
      expect(customer_response["last_name"]).to eq(new_customers.first.last_name)
    end
  end

  describe "GET #show, find multiple" do
    it "returns http success" do
      new_customers = create_list(:customer, 3)

      get "/api/v1/customers/find_all"
      
      customer_response = JSON.parse(response.body)["data"]
      expect(customer_response.count).to eq(3)
      expect(customer_response.first["attributes"]["id"]).to eq(new_customers.first.id)
      expect(customer_response.first["attributes"]["first_name"]).to eq(new_customers.first.first_name)
      expect(customer_response.first["attributes"]["last_name"]).to eq(new_customers.first.last_name)
    end
  end

end
