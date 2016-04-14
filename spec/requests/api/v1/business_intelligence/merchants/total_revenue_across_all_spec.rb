require 'rails_helper'

describe "Single merchant business intelligence" do
  it "returns zero revenue for a given merchant with no invoices" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}/revenue"

    json = JSON.parse(response.body)
    expect(response).to be_success

    total_revenue = json["revenue"]

    expect(total_revenue).to eq(0.00)

  end

  it "returns total revenue for a given merchant" do
    invoice = create(:invoice)
    invoice.invoice_items << create(:invoice_item, unit_price: 100)
    merchant = invoice.merchant

    get "/api/v1/merchants/#{merchant.id}/revenue"

    json = JSON.parse(response.body)
    expect(response).to be_success
    total_revenue = json["revenue"]

    expect(total_revenue).to eq(1.00)
  end
end
