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
end
