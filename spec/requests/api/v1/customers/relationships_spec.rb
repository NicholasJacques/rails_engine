require 'rails_helper'

describe "Customers Relationships Api" do
  it "returns a collection of associated invoices" do
    customer = create(:customer)
    invoice_1 = create_list(:invoice, 2, customer: customer).first
    create(:invoice)

    get "/api/v1/customers/#{customer.id}/invoices"
    returned_invoices = JSON.parse(response.body)
    first_returned_invoice = returned_invoices.first

    expect(response).to be_success
    expect(returned_invoices.count).to eq(2)
    expect(returned_invoices).to be_a(Array)
    expect(first_returned_invoice).to be_a(Hash)
    expect(first_returned_invoice['status']).to eq(invoice_1.status)
    expect(first_returned_invoice['id']).to eq(invoice_1.id)
  end
  it "returns a collection of associated transactions" do 
    invoice = create(:invoice)
    customer = invoice.customer
    transaction_1 = create_list(:transaction, 2, invoice: invoice).first

    create(:transaction)

    get "/api/v1/customers/#{customer.id}/transactions"
    returned_transactions = JSON.parse(response.body)
    returned_transaction = returned_transactions.first

    expect(response).to be_success
    expect(returned_transactions.count).to eq(2)
    expect(returned_transactions).to be_a(Array)
    expect(returned_transaction).to be_a(Hash)
    expect(returned_transaction["credit_card_number"]).to eq(transaction_1.credit_card_number)
    expect(returned_transaction["id"]).to eq(transaction_1.id)
    end
end
