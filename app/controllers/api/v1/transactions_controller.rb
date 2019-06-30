class Api::V1::TransactionsController < ApplicationController
  def index
    render json: TransactionSerializer.new(Transaction.all)
  end

  def show
    # require 'pry'; binding.pry
    render json: TransactionSerializer.new(Transaction.find_by(id: params[:id]))
  end
end