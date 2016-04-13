require 'rails_helper'

describe "Customers relationships API endpoints" do
  it "returns the invoices associated with an customer" do
    customer = create(:customer)
    customer.invoices << create_list(:invoice, 5)

    get "/api/v1/customers/#{customer.id}/invoices"

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq(5)
    json.each do | invoice |
      invoice = Invoice.find(invoice["id"])
      expect(invoice).to be_a_kind_of(Invoice)
    end
  end

  it "returns the transactions associated with an customer" do
    customer = create(:customer)
    customer.invoices << create_list(:invoice_with_transactions, 5)

    get "/api/v1/customers/#{customer.id}/transactions"

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq(15)
    json.each do | transaction |
      transaction = Transaction.find(transaction["id"])
      expect(transaction).to be_a_kind_of(Transaction)
    end
  end
end
