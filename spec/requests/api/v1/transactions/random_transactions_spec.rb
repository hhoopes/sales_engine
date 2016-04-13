require 'rails_helper'

describe "transactions API" do
  it "random returns a single transaction" do
    create_list(:transaction, 20)

    get "/api/v1/transactions/random"

    json = JSON.parse(response.body)
    expect(response).to be_success

    count =
    json.count do | k, v |
      k == "id"
    end

    expect(count).to eq(1)
    expect(["success", "failed"]).to include(json["result"])
  end
end
