require 'rails_helper'

describe "Invoices API" do
  it "find returns a single invoice" do
    create_list(:invoice, 20)
    invoice = Invoice.last
    get "/api/v1/invoices/find?id=#{invoice.id}"

    json = JSON.parse(response.body)

    expect(response).to be_success

    count =
    json.count do | k, v |
      k == "id"
    end

    expect(count).to eq(1)
    expect(json["status"]).to eq(Invoice.last.status)
    expect(json["id"]).to eq(Invoice.last.id)
 end
end
