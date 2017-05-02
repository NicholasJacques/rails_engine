require 'rails_helper'

describe 'Customer Random API' do
  it 'finds a random customer' do
    customer = create(:customer)

    get '/api/v1/customers/random'
    random = JSON.parse(response.body)

    expect(response).to be_success
    expect(random['id']).to eq(customer.id)
  end
end