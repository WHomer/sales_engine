class Api::V1::Customers::RandomsController < ApplicationController

  def show
    customer_count = rand(Customer.count)
    render json: CustomerSerializer.new(Customer.offset(customer_count).first)
  end

  private
  def customer_params
    params.permit(:first_name, :last_name, :id)
  end
end