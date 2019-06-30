class Api::V1::Transactions::FindsController < ApplicationController
  def index
    render json: TransactionSerializer.new(Transaction.where(transaction_params.as_json).order(:id))
  end

  def show
    render json: TransactionSerializer.new(Transaction.find_by(transaction_params.as_json))
  end

  private
  def transaction_params
    params.permit(:id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at)
  end
end