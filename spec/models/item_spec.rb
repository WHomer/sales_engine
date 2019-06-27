require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'validates relationships' do
    should{belong_to :merchant}
  end
end