require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it 'validates relationships' do
    should{belong_to :item}
    should{belong_to :invoice}
  end
end