class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    Merchant
      .joins(invoices: :transactions)
      .select("merchants.*, COUNT(transactions.id) as successful_transactions")
      .where("transactions.result = 'success' AND invoices.customer_id = ?", self.id)
      .group("merchants.id")
      .order("successful_transactions DESC")
      .limit(1)
  end
end