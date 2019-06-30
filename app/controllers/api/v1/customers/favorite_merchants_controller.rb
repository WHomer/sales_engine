class Api::V1::Customers::FavoriteMerchantsController < ApplicationController
  def show
    customer = Customer.find_by(id: params["id"])
    render json: MerchantSerializer.new(customer.favorite_merchant)
  end
end