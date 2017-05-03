FactoryGirl.define do
  factory :transaction do
    invoice_id 1
    credit_card_number "4654405418249632"
    credit_card_expiration_date ""
    result "success"
    created_at "2017-05-01 23:12:28"
    updated_at "2017-05-01 23:12:28"
  end
end
