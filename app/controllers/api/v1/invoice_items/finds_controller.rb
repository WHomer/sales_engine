class Api::V1::InvoiceItems::FindsController < ApplicationController
  def index

    render json: InvoiceItemSerializer.new(InvoiceItem.where(invoice_item_params.as_json))
  end

  def show
    render json: InvoiceItemSerializer.new(InvoiceItem.find_by(invoice_item_params.as_json))
  end

  private
  def invoice_item_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price)
  end
end