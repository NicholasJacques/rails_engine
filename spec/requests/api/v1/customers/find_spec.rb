require 'rails_helper'

describe 'Customer Find API' do
  it 'finds a customer by any associated attributes' do
    customer = create(:customer)
    the_named = customer.first_name

    get "/api/v1/customers/find?first_name=#{the_named}"
    returned_customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(returned_customer['id']).to eq(customer.id)
  end

  it 'finds all customers by any associated attributes' do
    customer_1,customer_2 = create_list(:customer, 2)
    customer_3 = create(:customer, first_name: "Heber")
    name_first = customer_1.first_name

    get "/api/v1/customers/find_all?first_name=#{name_first}"
    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.count).to eq(2)
  end
end
