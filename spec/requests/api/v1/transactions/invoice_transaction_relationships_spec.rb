require 'rails_helper'

describe "Transactions relationships API endpoints" do
  it "returns invoice for a transaction" do
    create_list(:invoice_with_transactions, 6)

    transaction = Transaction.last
    invoice = transaction.invoice

    get "/api/v1/transactions/#{transaction.id}/invoice"

    json = JSON.parse(response.body)

    expect(response).to be_success

    found_invoice = Invoice.find(json["id"])
    expect(found_invoice).to eq(invoice)
  end
end
