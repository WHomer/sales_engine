FactoryBot.define do
  factory :transactions do
    credit_card_number {"500000000000000"}
    credit_card_expiration_date {""}
    result {"successful"}
  end
end