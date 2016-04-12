require 'rails_helper'

describe "Invoices API" do
  it "returns a single invoice" do
    create_list(:invoice, 3)
    invoice = Invoice.last

    get "/api/v1/invoices/#{invoice.id}"
    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json["status"]).to eq(Invoice.last.status)
  end
end
