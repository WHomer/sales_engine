class Api::V1::Items::RandomsController < ApplicationController

  def show
    item_count = rand(Item.count)
    render json: ItemSerializer.new(Item.offset(item_count).first)
  end
end