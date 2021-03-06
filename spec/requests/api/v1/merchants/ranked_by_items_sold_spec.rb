require 'rails_helper'

describe "merchants ranked by items sold endpoint" do
  let!(:top_merchant) { create(:merchant, name: "top") }
  let!(:middle_merchant) { create(:merchant, name: "mid") }
  let!(:bottom_merchant) { create(:merchant, name: "bottom") }
  let!(:invoice_1) { create(:invoice, merchant: top_merchant) }
  let!(:invoice_2) { create(:invoice, merchant: middle_merchant) }
  let!(:invoice_3) { create(:invoice, merchant: bottom_merchant) }
  let!(:transaction_1) { create(:transaction, invoice: invoice_1, result: "success") }
  let!(:transaction_2) { create(:transaction, invoice: invoice_2, result: "success") }
  let!(:transaction_3) { create(:transaction, invoice: invoice_3, result: "success") }
  let!(:invoice_item_1) { create(:invoice_item, invoice: invoice_1, quantity: 40) }
  let!(:invoice_item_2) { create(:invoice_item, invoice: invoice_2, quantity: 25) }
  let!(:invoice_item_3) { create(:invoice_item, invoice: invoice_3, quantity: 10) }

  context '3 merchants all successful transactions' do
    it 'returns top x merchants sorted by items sold' do
      get '/api/v1/merchants/most_items?quantity=2'
      returned_merchants = JSON.parse(response.body)
      expect(response).to be_success
      expect(returned_merchants).to be_a(Array)
      expect(returned_merchants.count).to eq(2)
      expect(returned_merchants.first).to be_a(Hash)
      expect(returned_merchants.first['id']).to eq(top_merchant.id)
      expect(returned_merchants.last['id']).to eq(middle_merchant.id)
    end
  end
  context 'Add a failed transaction associated with a merchant' do
    let!(:failed_merchant) { create(:merchant, name: 'failure') }
    let!(:invoice_4) { create(:invoice, merchant: failed_merchant) }
    let!(:transaction_4) { create(:transaction, invoice: invoice_4, result: "failed" )}
    let!(:invoice_item_4) { create(:invoice_item, invoice: invoice_4, quantity: 50 )}
    
    it 'does not return the merchant with a failed transaction' do
      get '/api/v1/merchants/most_items?quantity=2'
      returned_merchants = JSON.parse(response.body)
      expect(response).to be_success
      expect(returned_merchants).to be_a(Array)
      expect(returned_merchants.count).to eq(2)
      expect(returned_merchants.first).to be_a(Hash)
      expect(returned_merchants.first['id']).to eq(top_merchant.id)
      expect(returned_merchants.last['id']).to eq(middle_merchant.id)
    end
  end
end
