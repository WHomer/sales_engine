class Api::V1::Customers::InvoicesController < ApplicationController
  def index
    customer = Customer.find_by(id: params["id"])
    render json: InvoiceSerializer.new(customer.invoices)
  end

  private
  def customer_params
    params.permit(:first_name,:last_name, :id, :created_at, :updated_at)
  end
end