require 'rails_helper'

describe 'Invoice_Items Relationships API' do 
  it 'can return the associated invoice' do
    invoice_item = create(:invoice_item)
    invoice = invoice_item.invoice

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"
    returned_invoice = JSON.parse(response.body)
    
    expect(response).to be_success
    expect(returned_invoice).to be_a(Hash)
    expect(returned_invoice["id"]).to eq(invoice.id)
  end
  it 'can return the associated item' do 
    invoice_item = create(:invoice_item)
    item = invoice_item.item

    get "/api/v1/invoice_items/#{invoice_item.id}/item"
    returned_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(returned_item).to be_a(Hash)
    expect(returned_item["id"]).to eq(item.id)
  end
end


