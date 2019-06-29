class Api::V1::Transactions::RandomsController < ApplicationController

  def show
    transaction_count = rand(Transaction.count)
    render json: TransactionSerializer.new(Transaction.offset(transaction_count).first)
  end
end