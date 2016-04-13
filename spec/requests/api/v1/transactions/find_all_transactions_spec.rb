require 'rails_helper'

describe "Transactions API" do
  it "find_all returns multiple transactions" do
    5.times do
      create(:transaction, result: "success")
    end
    transaction = Transaction.last

    3.times do
      create(:transaction, result: "failed")
    end

    expect(Transaction.count).to eq(8)

    get "/api/v1/transactions/find_all?result=#{transaction.result}"
    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq(5)

    json.each do | result |
      expect(result["result"]).to eq("success")
    end
  end
end
