require 'rails_helper'

describe "Transactions Relationships Api" do
  it "returns the associated invoice for that transaction" do
    transaction = create(:transaction)
    invoice = transaction.invoice

    get "/api/v1/transactions/#{transaction.id}/invoice"
    returned_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(returned_invoice).to be_a(Hash)
    expect(returned_invoice['id']).to eq(invoice.id)
  end
end
