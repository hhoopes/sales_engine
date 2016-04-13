require 'rails_helper'

describe "Transactions API" do
  it "find returns a single transaction" do
    create_list(:transaction, 20)
    transaction = Transaction.last
    get "/api/v1/transactions/find?id=#{transaction.id}"

    json = JSON.parse(response.body)

    expect(response).to be_success

    count =
    json.count do | k, v |
      k == "id"
    end

    expect(count).to eq(1)
    expect(json["result"]).to eq(Transaction.last.result)
    expect(json["id"]).to eq(Transaction.last.id)
  end
end
