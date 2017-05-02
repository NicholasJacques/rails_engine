require 'rails_helper'

describe 'invoice_items API' do
  it 'sends a list of all invoice_items' do
    invoice_item = create_list(:invoice_item, 3).first

    get '/api/v1/invoice_items'
    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
    expect(invoice_items.first['item_id']).to eq(invoice_item.item_id)
  end
  it 'can get one invoiceitem by its ID' do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/#{id}"
    invoice_item = JSON.parse(response.body)

    expect(invoice_item['id']).to eq(id)
    expect(response).to be_success
  end
end
