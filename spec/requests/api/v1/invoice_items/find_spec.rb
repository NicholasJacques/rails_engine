require 'rails_helper'

describe 'InvoiceItem Find API' do
  it 'finds an invoice_item by any associated attributes' do
    invoice_item = create(:invoice_item)
    an_item_id = invoice_item.item_id

    get "/api/v1/invoice_items/find?item_id=#{an_item_id}"
    returned_invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(returned_invoice_item['id']).to eq(invoice_item.id)
  end

  it 'finds all invoice_items by any associated attributes' do
    item = create(:item)
    invoice_item_1, invoice_item_2 = create_list(:invoice_item, 2, item: item)
    invoice_item_3 = create(:invoice_item)
    the_item_id = invoice_item_1.item_id

    get "/api/v1/invoice_items/find_all?item_id=#{the_item_id}"
    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.count).to eq(2)
  end
end
