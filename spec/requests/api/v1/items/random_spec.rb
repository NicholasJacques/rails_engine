require 'rails_helper'

describe 'Item Random API' do
  it 'finds a random item' do
    item = create(:item)

    get '/api/v1/items/random'
    random = JSON.parse(response.body)

    expect(response).to be_success
    expect(random['id']).to eq(item.id)
  end
end