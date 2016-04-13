require 'rails_helper'

describe "Transactions API" do
  it "returns a single transaction" do
    create_list(:transaction, 3)
    transaction = Transaction.last

    get "/api/v1/transactions/#{transaction.id}"
    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json["result"]).to eq(Transaction.last.result)
  end
end
