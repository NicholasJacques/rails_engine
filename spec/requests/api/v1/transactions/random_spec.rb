require 'rails_helper'

describe 'Transaction Random API' do
  it 'finds a random transaction' do
    transaction = create(:transaction)

    get '/api/v1/transactions/random'
    random = JSON.parse(response.body)

    expect(response).to be_success
    expect(random['id']).to eq(transaction.id)
  end
end