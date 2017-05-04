require 'rails_helper'

describe "merchants business intelligence Api" do
  let!(:most_revenue_merchant) { create(:merchant) }
  let!(:least_revenue_merchant) { create(:merchant) }
  let!(:item_1) { create(:item, merchant: most_revenue_merchant) }
  let!(:item_2) { create(:item, merchant: least_revenue_merchant) }
  let!(:invoice_1) { create(:invoice, merchant: most_revenue_merchant) }
  let!(:invoice_2) { create(:invoice, merchant: least_revenue_merchant) }
  let!(:transaction_1) { create(:transaction, invoice: invoice_1, result: "success") }
  let!(:transaction_2) { create(:transaction, invoice: invoice_2, result: "success") }
  let!(:invoice_item_1) { create(:invoice_item, invoice: invoice_1, item: item_1, quantity: 15, unit_price: 15000) }
  let!(:invoice_item_2) { create(:invoice_item, invoice: invoice_2, item: item_2, quantity: 2, unit_price: 120) }

  # what is revenue?
  # merchant transactions that result in success
  # go the invoice for that transaction
  # sum of all invoice_item total prices (quantity * unit_price)
  # for all invoice_items associated with that invoice

  it "returns top x merchants sorted by revenue" do
    get '/api/v1/merchants/most_revenue?quantity=1'
    returned_merchants = JSON.parse(response.body)
    expect(response).to be_success
    expect(returned_merchants).to be_a(Array)
    expect(returned_merchants.count).to eq(1)
    expect(returned_merchants.first).to be_a(Hash)
    expect(returned_merchants.first['id']).to eq(most_revenue_merchant.id)
  end
end
