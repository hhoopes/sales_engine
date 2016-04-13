require 'rails_helper'

describe "Items API" do
  it "find_all returns multiple items" do
    create_list(:item, 5)
    item = Item.last

    expect(Item.count).to eq(5)
    duplicate_merchant = Item.create(name: item.name)
    expect(Item.count).to eq(6)

    get "/api/v1/items/find_all?name=#{item.name}"
    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq(2)

    json.each do | result |
      expect(result["name"]).to eq(Item.last.name)
    end
  end
end
