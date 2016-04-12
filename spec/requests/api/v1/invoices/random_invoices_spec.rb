require 'rails_helper'

describe "Invoices API" do
  it "random returns a single invoice" do
    create_list(:invoice, 20)
    invoice = Invoice.last

    get "/api/v1/invoices/random"

    json = JSON.parse(response.body)
    expect(response).to be_success

    count =
    json.count do | k, v |
      k == "id"
    end

    expect(count).to eq(1)
    expect([0,1]).to include(json["status"].to_i)
  end
end
