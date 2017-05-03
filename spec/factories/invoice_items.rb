FactoryGirl.define do
  factory :invoice_item do
    item
    invoice
    quantity 1
    unit_price 1
    created_at "2017-05-02 13:56:08"
    updated_at "2017-05-02 13:56:08"
  end
end
