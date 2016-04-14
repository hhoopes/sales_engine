require 'rails_helper'

describe "Items API" do
  it "returns a formatted unit price" do
    create_list(:item, 3)
    item = Item.last
    unit_price = item.unit_price
    formatted_price = unit_price.to_f/100

    get "/api/v1/items/#{item.id}"
    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json["unit_price"]).to eq(formatted_price.to_s)
  end
end
