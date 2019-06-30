FactoryBot.define do
  factory :transaction do
    credit_card_number {"500000000000000"}
    credit_card_expiration_date {""}
    result {"success"}
  end
end