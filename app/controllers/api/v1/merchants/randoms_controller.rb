class Api::V1::Merchants::RandomsController < ApplicationController

  def show
    merchant_count = rand(Merchant.count)
    render json: MerchantSerializer.new(Merchant.offset(merchant_count).first)
  end

  private
  def merchant_params
    params.permit(:name, :id)
  end
end