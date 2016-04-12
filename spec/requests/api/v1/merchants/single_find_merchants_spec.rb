require 'rails_helper'

describe "Merchants API" do
  it "find returns a single merchant" do
    create_list(:merchant, 20)
    merchant = Merchant.last
    get "/api/v1/merchants/find?id=#{merchant.id}"
    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.count).to eq(4)
    expect(json["name"]).to eq(Merchant.last.name)
    expect(json["id"]).to eq(Merchant.last.id)
 end
end
