require 'rails_helper'

describe 'Item Find API' do
  it 'finds an item by any associated attributes' do
    item = create(:item)
    naming = item.name

    get "/api/v1/items/find?name=#{naming}"
    returned_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(returned_item['id']).to eq(item.id)
  end

  it 'finds all items by any associated attributes' do
    item_1, item_2 = create_list(:item, 2)
    item_3 = create(:item, name: "Item Autem Minima")
    named = item_1.name

    get "/api/v1/items/find_all?name=#{named}"
    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.count).to eq(2)
  end
end
