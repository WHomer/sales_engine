class Api::V1::Invoices::RandomsController < ApplicationController

  def show
    invoice_count = rand(Invoice.count)
    render json: InvoiceSerializer.new(Invoice.offset(invoice_count).first)
  end
end