require 'rails_helper'

describe 'Customers API' do
  it 'sends a list of all customers' do
    customer = create_list(:customer, 3).first

    get '/api/v1/customers'
    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers.count).to eq(3)
    expect(customers.first['first_name']).to eq(customer.first_name)
  end
  it 'can get one customer by its ID' do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"
    customer = JSON.parse(response.body)

    expect(customer['id']).to eq(id)
    expect(response).to be_success
  end
end
