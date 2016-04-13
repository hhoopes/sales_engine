require 'rails_helper'

describe "Invoices relationships API endpoints" do
  it "returns the merchant associated with an invoice" do
    create_list(:invoice, 3)

    expect(Merchant.count).to eq(3)
    expect(Invoice.count).to eq(3)

    invoice = Invoice.last
    get "/api/v1/invoices/#{invoice.id}/merchant"

    json = JSON.parse(response.body)

    expect(response).to be_success

    merchant = Merchant.find(json["id"])
    expect(merchant).to eq(invoice.merchant)

  end
end
