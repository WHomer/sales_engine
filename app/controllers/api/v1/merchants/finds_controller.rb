class Api::V1::Merchants::FindsController < ApplicationController
  def index

    render json: MerchantSerializer.new(Merchant.where(merchant_params.as_json))
  end

  def show
    render json: MerchantSerializer.new(Merchant.find_by(merchant_params.as_json))
  end

  private
  def merchant_params
    params.permit(:name, :id, :created_at, :updated_at)
  end
end