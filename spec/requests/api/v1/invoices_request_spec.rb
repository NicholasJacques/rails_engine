require 'rails_helper'

describe 'invoices API' do
  it 'sends a list of all invoices' do
    invoice = create_list(:invoice, 3).first

    get '/api/v1/invoices'
    invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoices.count).to eq(3)
    expect(invoices.first['customer_id']).to eq(invoice.customer_id)
  end
  it 'can get one invoice by its ID' do
    id = create(:invoice).id

    get "/api/v1/invoices/#{id}"
    invoice = JSON.parse(response.body)

    expect(invoice['id']).to eq(id)
    expect(response).to be_success
  end
end
