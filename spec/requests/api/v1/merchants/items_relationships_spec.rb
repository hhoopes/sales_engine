require 'rails_helper'

describe "Merchants relationships API endpoints" do
  it "returns all items for a merchant" do
    create_list(:merchant_with_items, 3)

    expect(Item.count).to eq(9)
    expect(Merchant.count).to eq(3)
    merchant = Merchant.last
    get "/api/v1/merchants/#{merchant.id}/items"

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq(3)

    json.each do | item |
      items_merchant = Merchant.find(item["merchant_id"])
      expect(items_merchant).to eq(merchant)
    end
  end
end
