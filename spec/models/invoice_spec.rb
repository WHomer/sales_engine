require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it 'validates relationships' do
    should{belong_to :customer}
    should{belong_to :merchant}
    should{have_many :invoices}
  end
end