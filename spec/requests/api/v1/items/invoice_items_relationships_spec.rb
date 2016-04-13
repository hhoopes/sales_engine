require 'rails_helper'

describe "Items relationships API endpoints" do
  it "returns all invoice_items for an item" do
    create_list(:invoice_item, 6)

    item = Item.last

    get "/api/v1/items/#{item.id}/invoice_items"

    json = JSON.parse(response.body)

    expect(response).to be_success

    json.each do | invoice_item |
      invoice_item_item = Item.find(invoice_item["item_id"])
      expect(invoice_item_item).to eq(item)
    end
  end
end
