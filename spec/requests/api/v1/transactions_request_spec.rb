require 'rails_helper'

describe 'transactions API' do
  it 'sends a list of all transactions' do
    transaction = create_list(:transaction, 3).first

    get '/api/v1/transactions'
    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.count).to eq(3)
    expect(transactions.first['credit_cart_number']).to eq('4654405418249632')
  end
  it 'can get one transaction by its ID' do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"
    transaction = JSON.parse(response.body)

    expect(transaction['id']).to eq(id)
    expect(response).to be_success
  end
end
