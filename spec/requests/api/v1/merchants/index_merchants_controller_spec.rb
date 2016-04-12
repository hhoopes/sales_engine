require 'rails_helper'

describe "Merchants API" do
  it "returns all merchants" do
    create_list(:merchant, 20)
    get '/api/v1/merchants'
    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.length).to eq(20)
    expect(json.last["name"]).to eq(Merchant.last.name)
 end
end
