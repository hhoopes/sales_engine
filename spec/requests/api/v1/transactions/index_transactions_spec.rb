require 'rails_helper'

describe "Transactions API" do
  it "returns all transactions" do
    create_list(:transaction, 20)
    get '/api/v1/transactions'

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq(20)
    expect(json.last["result"]).to eq(Transaction.last.result)
  end
end
