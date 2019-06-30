class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices

  def revenue
    invoices.joins(:transactions, :invoice_items).where("transactions.result = 'success'").select("SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue").take
  end

  def revenue_by_date(date)
    invoices.joins(:transactions, :invoice_items).where("transactions.result = 'success' AND CAST(invoices.created_at AS text) LIKE ?", "#{date}%").select("SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue").take
  end

  def favorite_customer
    self.customers.joins(:transactions).select("customers.*, COUNT(transactions.id) as total_successful_transactions").group("customers.id").order("total_successful_transactions DESC").limit(1).take
  end

  def self.total_revenue(date)
    Merchant.joins(invoices: [:transactions, :invoice_items]).where("transactions.result = 'success' AND CAST(invoices.created_at AS text) LIKE ?", "#{date}%").select("SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue").take
  end

  def self.most_revenue(limit)
    Merchant.joins(invoices: [:transactions, :invoice_items]).where("transactions.result = 'success'").select("SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue").group("merchants.id").select("merchants.*").order("total_revenue DESC").limit(limit)
  end

  def self.most_items(limit)
    Merchant.joins(invoices: [:transactions, :invoice_items]).where("transactions.result = 'success'").select("SUM(invoice_items.quantity) AS total_items").group("merchants.id").select("merchants.*").order("total_items DESC").limit(limit)
  end
end
