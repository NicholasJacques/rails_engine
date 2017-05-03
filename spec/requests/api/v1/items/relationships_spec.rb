require 'rails_helper'

describe 'Items Relationships API' do 
  it 'returns all invoice items associated with that specific item' do
    item = create(:item)
    invoice_item = create_list(:invoice_item, 2, item: item).first
    create(:invoice_item)

    get "/api/v1/items/#{item.id}/invoice_items"
    returned_invoice_items = JSON.parse(response.body)
    returned_invoice_item = returned_invoice_items.first
    expect(response).to be_success
    expect(returned_invoice_items.count).to eq(2)
    expect(returned_invoice_items).to be_a(Array)
    expect(returned_invoice_item).to be_a(Hash)
    expect(returned_invoice_item["id"]).to eq(invoice_item.id)

  end
end