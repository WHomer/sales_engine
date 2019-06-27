require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'validates relationships' do
    should{have_many :invoices}
  end
end