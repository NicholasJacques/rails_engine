require 'rails_helper'

describe "Merchants Relationships Api" do
  it "can return all items associated with that merchant" do
    merchant = create(:merchant)
    item_1, item_2, item_3 = create_list(:item, 3, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"
    items = JSON.parse(response.body)
    returned_item_1 = items.first

    expect(response).to be_success
    expect(items.count).to eq(3)
    expect(items).to be_a(Array)
    expect(returned_item_1).to be_a(Hash)
    expect(returned_item_1['name']).to eq(item_1.name)
    expect(returned_item_1['merchant_id']).to eq(merchant.id)
  end

  it "can return all invoices associated with this merchant" do 
    merchant = create(:merchant)
    invoice_1, invoice_2, invoice_3 = create_list(:invoice, 3, merchant: merchant)
    get "/api/v1/merchants/#{merchant.id}/invoices"
    invoices = JSON.parse(response.body)
    returned_invoice_1 = invoices.first

    expect(response).to be_success
    expect(invoices.count).to eq(3)
    expect(invoices).to be_a(Array)
    expect(returned_invoice_1).to be_a(Hash)
    expect(returned_invoice_1["customer_id"]).to eq(invoice_1.customer_id)
    expect(returned_invoice_1['merchant_id']).to eq(merchant.id)
  end
end
