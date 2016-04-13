require 'rails_helper'

describe "Item API" do
  it "random returns a single item" do
    create_list(:item, 20)
    item = Item.last

    get "/api/v1/items/random"

    json = JSON.parse(response.body)
    expect(response).to be_success

    count =
    json.count do | k, v |
      k == "id"
    end

    expect(count).to eq(1)
    expect(json["name"]).to be_a_kind_of(String)

    match = Item.find_by(description: json["description"])
    expect(match).to be_a_kind_of(Item)
  end
end
