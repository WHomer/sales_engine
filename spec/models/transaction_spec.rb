require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'validates relationships' do
    should{belong_to :invoice}
  end
end