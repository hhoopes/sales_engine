require 'rails_helper'

describe "Items API" do
  it "returns all items" do
    create_list(:item, 20)
    get '/api/v1/items'
    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.length).to eq(20)
    expect(json.last["name"]).to eq(Item.last.name)
    expect(json.last["description"]).to eq(Item.last.description)
 end
end
