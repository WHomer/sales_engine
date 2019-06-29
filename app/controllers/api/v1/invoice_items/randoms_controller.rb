class Api::V1::InvoiceItems::RandomsController < ApplicationController

  def show
    invoice_item_count = rand(InvoiceItem.count)
    render json: InvoiceItemSerializer.new(InvoiceItem.offset(invoice_item_count).first)
  end
end