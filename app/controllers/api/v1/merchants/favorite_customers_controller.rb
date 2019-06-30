class Api::V1::Merchants::FavoriteCustomersController < ApplicationController
  def show
    merchant = Merchant.find_by(id: params["id"])
    render json: CustomerSerializer.new(merchant.favorite_customer)
  end
end