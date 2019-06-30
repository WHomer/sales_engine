class Api::V1::Merchants::RevenuesController < ApplicationController
  def index
    render json: TotalRevenueSerializer.new(Merchant.total_revenue(params["date"]))
  end
end