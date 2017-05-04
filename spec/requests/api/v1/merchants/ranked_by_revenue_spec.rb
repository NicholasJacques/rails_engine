require 'rails_helper'

describe 'merchants ranked by revenue endpoint' do
  let!(:most_revenue_merchant) { create(:merchant) }
  let!(:second_revenue_merchant) { create(:merchant) }
  let!(:least_revenue_merchant) { create(:merchant) }
  let!(:item_1) { create(:item, merchant: most_revenue_merchant) }
  let!(:item_2) { create(:item, merchant: second_revenue_merchant) }
  let!(:invoice_1) { create(:invoice, merchant: most_revenue_merchant) }
  let!(:invoice_2) { create(:invoice, merchant: second_revenue_merchant) }
  let!(:transaction_1) { create(:transaction, invoice: invoice_1, result: "success") }
  let!(:transaction_2) { create(:transaction, invoice: invoice_2, result: "success") }
  let!(:invoice_item_1) { create(:invoice_item, invoice: invoice_1, item: item_1, quantity: 15, unit_price: 15000) }
  let!(:invoice_item_2) { create(:invoice_item, invoice: invoice_2, item: item_2, quantity: 2, unit_price: 120) }

  context '3 merchants' do
    it 'returns top x merchants sorted by revenue' do
      get '/api/v1/merchants/most_revenue?quantity=2'
      returned_merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(returned_merchants).to be_a(Array)
      expect(returned_merchants.count).to eq(2)
      expect(returned_merchants.first).to be_a(Hash)
      expect(returned_merchants.first['id']).to eq(most_revenue_merchant.id)
      expect(returned_merchants.last['id']).to eq(second_revenue_merchant.id)
    end
  end

  context 'merchant with failed transaction' do
    let!(:invoice_3) { create(:invoice, merchant: least_revenue_merchant) }
    let!(:transaction_3) { create(:transaction, invoice: invoice_3, result: 'failed') }
    let!(:invoice_item_3) { create(:invoice_item, invoice: invoice_3, item: item_2, quantity: 25, unit_price: 15000) }

    it 'only counts successful transactions' do
      get '/api/v1/merchants/most_revenue?quantity=2'
      returned_merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(returned_merchants).to be_a(Array)
      expect(returned_merchants.count).to eq(2)
      expect(returned_merchants.first).to be_a(Hash)
      expect(returned_merchants.first['id']).to eq(most_revenue_merchant.id)
      expect(returned_merchants.last['id']).to eq(second_revenue_merchant.id)
    end
  end
end
