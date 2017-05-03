require 'rails_helper'

describe 'Invoices Relationships Api' do
  it 'can returns all transactions associated with that invoice' do
    invoice = create(:invoice)
    transaction_1 = create_list(:transaction, 2, invoice: invoice).first
    create(:transaction)

    get "/api/v1/invoices/#{invoice.id}/transactions"
    transactions = JSON.parse(response.body)
    returned_transaction_1 = transactions.first

    expect(response).to be_success
    expect(transactions.count).to eq(2)
    expect(transactions).to be_a(Array)
    expect(returned_transaction_1).to be_a(Hash)
    expect(returned_transaction_1['credit_card_number']).to eq(transaction_1.credit_card_number)
    expect(returned_transaction_1['invoice_id']).to eq(invoice.id)
  end

  it "can return all invoice items associated with that invoice" do
    invoice = create(:invoice)
    invoice_item_1 = create_list(:invoice_item, 2, invoice: invoice).first
    create(:invoice_item)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"
    invoice_items = JSON.parse(response.body)
    returned_invoice_item_1 = invoice_items.first

    expect(response).to be_success
    expect(invoice_items.count).to eq(2)
    expect(invoice_items).to be_a(Array)
    expect(returned_invoice_item_1['quantity']).to eq(invoice_item_1.quantity)
    expect(returned_invoice_item_1['invoice_id']).to eq(invoice.id)
  end

  it 'can return all items associated with an invoice' do
    invoice = create(:invoice)
    item_1, item_2 = create_list(:item, 2)
    create(:invoice_item, invoice: invoice, item: item_1)
    create(:invoice_item, invoice: invoice, item: item_2)
    create(:item)

    get "/api/v1/invoices/#{invoice.id}/items"
    items = JSON.parse(response.body)
    returned_item_1 = items.first
    expect(response).to be_success
    expect(items.count).to eq(2)
    expect(items).to be_a(Array)
    expect(returned_item_1).to be_a(Hash)
    expect(returned_item_1["name"]).to eq(item_1.name)
    expect(invoice.items.first.id).to eq(returned_item_1['id'])
  end

  it 'can return the customer associated with an invoice' do 
    customer = create(:customer)
    invoice = create(:invoice, customer: customer)

    get "/api/v1/invoices/#{invoice.id}/customer"
    returned_customer = JSON.parse(response.body)
    expect(response).to be_success
    expect(returned_customer).to be_a(Hash)
    expect(returned_customer["id"]).to eq(customer.id)
  end
end
