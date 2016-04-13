require 'rails_helper'

describe "Invoices relationships API endpoints" do
  it "returns the customer associated with an invoice" do
    create_list(:invoice, 3)

    expect(Customer.count).to eq(3)
    expect(Invoice.count).to eq(3)

    invoice = Invoice.last
    get "/api/v1/invoices/#{invoice.id}/customer"

    json = JSON.parse(response.body)

    expect(response).to be_success

    customer = Customer.find(json["id"])
    expect(customer).to eq(invoice.customer)

  end
end
