class Api::V1::Items::FindsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.where(item_params.as_json).order(:id))
  end

  def show
    render json: ItemSerializer.new(Item.where(item_params.as_json).order(:id).limit(1).take)
  end

  private
  def item_params
    if params["unit_price"]
      params["unit_price"] = (params["unit_price"].to_f * 100).round
    end
    params.permit(:name, :id, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end