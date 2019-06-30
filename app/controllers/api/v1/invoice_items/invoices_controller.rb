class Api::V1::InvoiceItems::InvoicesController < ApplicationController
  def show
    invoice_items = InvoiceItem.find_by(id: params["id"])
    render json:InvoiceSerializer.new(invoice_items.invoice)
  end
end