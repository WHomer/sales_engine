class Api::V1::Invoices::FindsController < ApplicationController
  def index

    render json: InvoiceSerializer.new(Invoice.where(invoice_params.as_json))
  end

  def show
    render json: InvoiceSerializer.new(Invoice.find_by(invoice_params.as_json))
  end

  private
  def invoice_params
    params.permit(:status, :id, :customer_id, :merchant_id, :created_at, :updated_at)
  end
end