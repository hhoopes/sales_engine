require 'rails_helper'

describe "Invoices relationships API endpoints" do
  it "returns all transactions for an invoice" do
    create_list(:invoice_with_transactions, 3)

    expect(Transaction.count).to eq(9)
    expect(Invoice.count).to eq(3)

    invoice = Invoice.last
    get "/api/v1/invoices/#{invoice.id}/transactions"

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq(3)

    json.each do | transaction |
      transaction_invoice = Invoice.find(transaction["invoice_id"])
      expect(transaction_invoice).to eq(invoice)
    end
  end
end
