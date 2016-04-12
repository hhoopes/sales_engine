require 'rails_helper'

describe "Merchants API" do
  it "find_all returns multiple merchants" do
    create_list(:merchant, 5)
    merchant = Merchant.last

    expect(Merchant.count).to eq(5)
    duplicate_merchant = Merchant.create(name: merchant.name)
    expect(Merchant.count).to eq(6)

    get "/api/v1/merchants/find_all?name=#{merchant.name}"
    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq(2)

    json.each do | result |
      expect(result["name"]).to eq(Merchant.last.name)
    end
  end
end
