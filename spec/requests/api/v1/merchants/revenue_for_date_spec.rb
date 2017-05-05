require 'rails_helper'

describe 'Revenue across all merchants by date endpoint' do
  let!(:merchant_1) { create(:merchant) }
  let!(:merchant_2) { create(:merchant) }
  let!(:invoice_1) { create(:invoice, merchant: merchant_1) }
  let!(:invoice_2) { create(:invoice, merchant: merchant_2) }
  let!(:transaction_1) { create(:transaction, invoice: invoice_1, result: 'success') }
  let!(:transaction_2) { create(:transaction, invoice: invoice_2, result: 'success') }
  let!(:invoice_item_1) { create(:invoice_item, invoice: invoice_1, quantity: 50, unit_price: 1500 )}
  let!(:invoice_item_2) { create(:invoice_item, invoice: invoice_2, quantity: 10, unit_price: 1000 )}
  let!(:total_revenue) { (((50 * 1500) + (10 * 1000)) / 100.to_f).to_s}

  it 'returns total revenue across all merchants on a given date' do 
    get "/api/v1/merchants/revenue?date=#{invoice_1.created_at}"
    returned_revenue_by_date = JSON.parse(response.body)

    expect(response).to be_success
    expect(returned_revenue_by_date).to be_a(Hash)
    expect(returned_revenue_by_date).to have_key("total_revenue")
    expect(returned_revenue_by_date["total_revenue"]).to eq(total_revenue)
  end
end
