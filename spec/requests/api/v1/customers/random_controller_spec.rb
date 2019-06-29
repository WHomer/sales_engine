require 'rails_helper'

describe do
  describe "GET #index, find random single" do
    it "returns http success" do
      new_customers = create_list(:customer, 3)

      get "/api/v1/customers/random"

      expect(response).to have_http_status(:success)
    end
  end
end
