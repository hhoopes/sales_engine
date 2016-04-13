require 'rails_helper'

describe "Items API" do
  it "returns a single item" do
    create_list(:item, 3)
    item = Item.last

    get "/api/v1/items/#{item.id}"
    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json["name"]).to eq(Item.last.name)
    expect(json["description"]).to eq(Item.last.description)
  end
end
