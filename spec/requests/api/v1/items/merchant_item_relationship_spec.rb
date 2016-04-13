require 'rails_helper'

describe "Items relationships API endpoints" do
  it "returns merchant associated with an item" do
    create_list(:item, 6)

    item = Item.last
    merchant = item.merchant

    get "/api/v1/items/#{item.id}/merchant"

    json = JSON.parse(response.body)

    expect(response).to be_success

    found_merchant = Merchant.find(json["id"])
    expect(found_merchant).to eq(merchant)
  end
end
