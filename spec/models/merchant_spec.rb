require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it 'validates relationships' do
    should{have_many :items}
  end
end