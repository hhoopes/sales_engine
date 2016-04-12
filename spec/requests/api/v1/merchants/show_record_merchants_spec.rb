require 'rails_helper'

describe "Merchants API" do
  it "returns a single merchant" do
    create_list(:merchant, 3)
    merchant = Merchant.last
    
    get "/api/v1/merchants/#{merchant.id}"
    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json["name"]).to eq(Merchant.last.name)
 end
end
