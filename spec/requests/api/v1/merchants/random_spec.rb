require 'rails_helper'

describe 'Merchant Random API' do
  it "finds a random merchant resource" do 
    merchant = create(:merchant)

    get "/api/v1/merchants/random"
    random = JSON.parse(response.body)
    expect(response).to be_success
    expect(random["id"]).to eq(merchant.id)

  end
end