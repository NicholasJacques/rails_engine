require 'rails_helper'

describe 'merchants API' do 
  it 'sends a list of all merchants' do 
    merchant = create_list(:merchant, 3).first
    get '/api/v1/merchants'

    expect(response).to be_success
    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(3)
    expect(merchants.first["name"]).to eq(merchant.name)
  end
  it 'can get ID for a specific merchant' do 
    id = create(:merchant).id 
    get "/api/v1/merchants/#{id}"
    item = JSON.parse(response.body)

    expect(item["id"]).to eq(id)
    expect(response).to be_success
  end
end




