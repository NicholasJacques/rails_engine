require 'rails_helper'

describe 'Invoice Find API' do
  it 'finds an invoice by any associated attributes' do
    invoice = create(:invoice)
    associated_merchant = invoice.merchant_id

    get "/api/v1/invoices/find?merchant_id=#{associated_merchant}"
    returned_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(returned_invoice['id']).to eq(invoice.id)
  end

  it 'finds all invoices by any associated attributes' do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)

    invoice_1, invoice_2 = create_list(:invoice, 2, merchant: merchant2)
    invoice_3 = create(:invoice, merchant: merchant1)
    merchant_identifier = invoice_1.merchant_id

    get "/api/v1/invoices/find_all?merchant_id=#{merchant_identifier}"
    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.count).to eq(2)
    # need to prove that invoice_3 is excluded
  end
end
