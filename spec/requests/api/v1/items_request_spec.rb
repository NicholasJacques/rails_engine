require 'rails_helper'

describe 'items API' do
  it 'sends a list of all items' do
    item = create_list(:item, 3).first

    get '/api/v1/items'
    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq(3)
    expect(items.first['name']).to eq(item.name)
  end
  it 'can get one item by its id' do
    id = create(:item).id

    get "/api/v1/items/#{id}"
    item = JSON.parse(response.body)

    expect(item['id']).to eq(id)
    expect(response).to be_success
  end
end
