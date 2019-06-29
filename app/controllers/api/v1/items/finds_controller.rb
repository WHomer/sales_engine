class Api::V1::Items::FindsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.where(item_params.as_json))
  end

  def show
    render json: ItemSerializer.new(Item.find_by(item_params.as_json))
  end

  private
  def item_params
    params.permit(:name, :id, :description, :unit_price, :merchant_id)
  end
end