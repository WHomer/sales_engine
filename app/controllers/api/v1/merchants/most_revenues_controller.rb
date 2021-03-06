class Api::V1::Merchants::MostRevenuesController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.most_revenue(params["quantity"]))
  end
end