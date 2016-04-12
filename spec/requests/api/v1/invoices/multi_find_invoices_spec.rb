require 'rails_helper'

describe "Invoices API" do
  it "find_all returns multiple invoices" do
    5.times do
      create(:invoice, status: 0)
    end
    2.times do
    create(:invoice, status: 1)
    end
    invoice = Invoice.last

    expect(Invoice.count).to eq(7)

    get "/api/v1/invoices/find_all?status=#{invoice.status}"
    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq(2)

    json.each do | result |
      expect(result["status"]).to eq("1")
    end
  end
end
