class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :item
  belongs_to :invoice

  attributes :id,
             :item_id,
             :invoice_id,
             :quantity,
             :unit_price
end
