require 'rails_helper'

describe 'InvoiceItems Random API' do
  it 'finds a random invoice_item' do
    invoice_item = create(:invoice_item)

    get '/api/v1/invoice_items/random'
    random = JSON.parse(response.body)

    expect(response).to be_success
    expect(random['id']).to eq(invoice_item.id)
  end
end