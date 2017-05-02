require 'rails_helper'

describe 'Transaction Find API' do
  it 'finds a transaction by any associated attributes' do
    transaction = create(:transaction)
    cc_number = transaction.credit_card_number

    get "/api/v1/transactions/find?credit_card_number=#{cc_number}"
    returned_transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(returned_transaction['id']).to eq(transaction.id)
  end

  # add tests for other attributes

  it 'finds all transactions by any associated attributes' do
    transaction_1, transaction_2 = create_list(:transaction, 2)
    transaction_3 = create(:transaction, credit_card_number: "4580251236515201")
    cc_number = transaction_1.credit_card_number

    get "/api/v1/transactions/find_all?credit_card_number=#{cc_number}"
    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.count).to eq(2)
    # need to prove that transaction_3 is excluded
  end
end
