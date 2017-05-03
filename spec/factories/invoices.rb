FactoryGirl.define do
  factory :invoice do
    customer
    merchant
    status "MyText"
    created_at "2017-05-02 11:44:45"
    updated_at "2017-05-02 11:44:45"
  end
end
