require 'rails_helper'

describe "Single merchant business intelligence" do
  it "returns zero revenue for a given merchant with no invoices" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}/revenue"

    json = JSON.parse(response.body)
    expect(response).to be_success

    total_revenue = json["revenue"]

    expect(total_revenue).to eq("0.0")

  end

  it "returns total revenue for a given merchant" do
    merchant = merchant_with_invoice_items

    get "/api/v1/merchants/#{merchant.id}/revenue"

    json = JSON.parse(response.body)
    expect(response).to be_success
    total_revenue = json["revenue"]

    expect(total_revenue).to eq("3.0")
  end

  it "returns the customer with most successful transactions" do
    merchant = merchant_with_invoice_items
    merchant2 = merchant_with_invoice_items

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"

    json = JSON.parse(response.body)
    expect(response).to be_success

  end
end
