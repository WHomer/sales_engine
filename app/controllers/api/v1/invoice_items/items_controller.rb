class Api::V1::InvoiceItems::ItemsController < ApplicationController
  def show
    invoice_items = InvoiceItem.find_by(id: params["id"])
    render json:ItemSerializer.new(invoice_items.item)
  end
end