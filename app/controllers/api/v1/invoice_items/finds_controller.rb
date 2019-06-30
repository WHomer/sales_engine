class Api::V1::InvoiceItems::FindsController < ApplicationController
  def index
    render json: InvoiceItemSerializer.new(InvoiceItem.where(invoice_item_params.as_json).order(:id))
  end

  def show
    render json: InvoiceItemSerializer.new(InvoiceItem.find_by(invoice_item_params.as_json))
  end

  private
  def invoice_item_params
    if params["unit_price"]
      params["unit_price"] = (params["unit_price"].to_f * 100).to_i.to_s
    end
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end
end