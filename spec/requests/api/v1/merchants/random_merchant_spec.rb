require 'rails_helper'

describe "Merchants API" do
  it "random returns a single merchant" do
    create_list(:merchant, 20)
    merchant = Merchant.last

    get "/api/v1/merchants/random"

    json = JSON.parse(response.body)
    expect(response).to be_success

    count =
    json.count do | k, v |
      k == "id"
    end

    expect(count).to eq(1)
    expect(json["name"]).to be_a_kind_of(String)
  end
end
