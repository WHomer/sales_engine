class Api::V1::TransactionsController < ApplicationController
  def index
    render json: Transactionserializer.new(Invoice.all)
  end

  def show
    render json: Transactionserializer.new(Invoice.find_by(id: params[:id]))
  end
end