require 'csv'

namespace :import_data do
  desc "TODO"
  task merchants: :environment do
    created_records = 0
    CSV.foreach("data/merchants.csv", {headers: true, header_converters: :symbol}) do |row|
      merchant = Merchant.new do |m|
        m.id =  row[:id]
        m.name = row[:name]
        m.created_at = row[:created_at]
        m.updated_at = row[:updated_at]
      end
      created_records += 1
      merchant.save
    end
    puts "imported #{created_records} in merchants table..."
  end

  desc "TODO"
  task items: :environment do
    created_records = 0
    CSV.foreach("data/items.csv", {headers: true, header_converters: :symbol}) do |row|
      item = Item.new do |i|
        i.id =  row[:id]
        i.name = row[:name]
        i.description = row[:description]
        i.unit_price = row[:unit_price]
        i.merchant_id = row[:merchant_id]
        i.created_at = row[:created_at]
        i.updated_at = row[:updated_at]
      end
      created_records += 1
      item.save
    end
    puts "imported #{created_records} in items table..."
  end

  desc "TODO"
  task transactions: :environment do
    created_records = 0
    CSV.foreach("data/transactions.csv", {headers: true, header_converters: :symbol}) do |row|
        transaction = Transaction.new do |t|
        t.id =  row[:id]
        t.invoice_id = row[:invoice_id]
        t.credit_card_number = row[:credit_card_number]
        t.credit_card_expiration_date = row[:credit_card_expiration_date]
        t.result = row[:result]
        t.created_at = row[:created_at]
        t.updated_at = row[:updated_at]
      end
      created_records += 1
      transaction.save
    end
    puts "imported #{created_records} in transactions table..."
  end

  desc "TODO"
  task customers: :environment do
    created_records = 0
    CSV.foreach("data/customers.csv", {headers: true, header_converters: :symbol}) do |row|
        customer = Customer.new do |c|
        c.id =  row[:id]
        c.first_name = row[:first_name]
        c.last_name = row[:last_name]
        c.created_at = row[:created_at]
        c.updated_at = row[:updated_at]
      end
      created_records += 1
      customer.save
    end
    puts "imported #{created_records} in customers table..."
  end

  desc "TODO"
  task invoice_items: :environment do
    file = "data/invoice_items.csv"
    # total_record_count = file.readlines.size
    created_records = 0
    CSV.foreach(file, {headers: true, header_converters: :symbol}) do |row|
        invoice_item = InvoiceItem.new do |i|
        i.id =  row[:id]
        i.item_id = row[:item_id]
        i.invoice_id = row[:invoice_id]
        i.quantity = row[:quantity]
        i.unit_price = row[:unit_price]
        i.created_at = row[:created_at]
        i.updated_at = row[:updated_at]
      end
      created_records += 1
      print ". " if created_records % 100 == 0
      invoice_item.save
    end
    puts "imported #{created_records} in invoice_items table..."
  end

  desc "TODO"
  task invoices: :environment do
    created_records = 0
    CSV.foreach("data/invoices.csv", {headers: true, header_converters: :symbol}) do |row|
        invoice = Invoice.new do |i|
        i.id =  row[:id]
        i.customer_id = row[:customer_id]
        i.merchant_id = row[:merchant_id]
        i.status = row[:status]
        i.created_at = row[:created_at]
        i.updated_at = row[:updated_at]
      end
      created_records += 1
      invoice.save
    end
    puts "imported #{created_records} in invoices table..."
  end

end
