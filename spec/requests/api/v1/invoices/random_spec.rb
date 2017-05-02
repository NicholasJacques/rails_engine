require 'rails_helper'

describe 'Invoice Random API' do
  it 'finds a random invoice' do
    invoice = create(:invoice)

    get '/api/v1/invoices/random'
    random = JSON.parse(response.body)

    expect(response).to be_success
    expect(random['id']).to eq(invoice.id)
  end
end