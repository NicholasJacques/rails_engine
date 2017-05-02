require 'rails_helper'

describe 'Merchant Find API' do
  it "finds a merchant by any associated attributes" do 
    merchant = create(:merchant)

    get "/api/v1/merchants/find?name=#{merchant.name}"
    returned_merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(returned_merchant["id"]).to eq(merchant.id)

  end
  it "finds all merchants by any associated attributes" do 
    merchant1, merchant2 = create_list(:merchant, 2)
    merchant3 = create(:merchant, name: "BillyBob")
    get "/api/v1/merchants/find_all?name=#{merchant1.name}"
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json.count).to eq(2)
    #need to prove that merchant3 name is excluded
  end

end