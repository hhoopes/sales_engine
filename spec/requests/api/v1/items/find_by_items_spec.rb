require 'rails_helper'

describe "Items API" do
  it "find returns a single item" do
    create_list(:item, 20)
    item = Item.last
    get "/api/v1/items/find?id=#{item.id}"

    json = JSON.parse(response.body)

    expect(response).to be_success

    count =
    json.count do | k, v |
      k == "id"
    end

    expect(count).to eq(1)
    expect(json["name"]).to eq(Item.last.name)
    expect(json["id"]).to eq(Item.last.id)
  end
end
