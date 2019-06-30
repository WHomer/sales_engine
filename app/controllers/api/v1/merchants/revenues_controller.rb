class Api::V1::Merchants::RevenuesController < ApplicationController
  def index
    render json: TotalRevenueSerializer.new(Merchant.total_revenue(params["date"]))
  end

  def show
    merchant = Merchant.find_by(id: params["id"])

    if params["date"]
      render json: RevenueSerializer.new(merchant.revenue_by_date(params["date"]))
    else
      render json: RevenueSerializer.new(merchant.revenue)
    end
  end
end