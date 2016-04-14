require 'rails_helper'

describe "All merchants business intelligence" do
  it "returns top x merchants ranked by total revenue" do
    merchant = merchant_with_invoice_items(100)
    merchant2 = merchant_with_invoice_items(200)
    merchant3 = merchant_with_invoice_items(300)

    get "/api/v1/merchants/most_revenue?quantity=2"

    result = JSON.parse(response.body)
    expect(response).to be_success

    highest_merchant = Merchant.find(result.first["id"])

    expect(result.length).to eq(2)
    expect(highest_merchant).to eq(merchant3)
  end

  it "returns top x merchants for amount of items sold" do
    merchant = merchant_with_number_invoice_items(1)
    merchant2 = merchant_with_number_invoice_items(2)
    merchant3 = merchant_with_number_invoice_items(3)

    get "/api/v1/merchants/most_items?quantity=2"

    result = JSON.parse(response.body)
    expect(response).to be_success

    highest_merchant = Merchant.find(result.first["id"])
    expect(result.length).to eq(2)
    expect(highest_merchant).to eq(merchant3)
  end

  xit "returns the total revenue for a given date for all merchants" do
    merchant = merchant_with_invoice_items(100)
    merchant2 = merchant_with_invoice_items(200)
    merchant3 = merchant_with_invoice_items(300)
    date = merchant.invoices.first.created_at.to_s

    get "/api/v1/merchants/revenue?date=#{date}"

    result = response.body
    expect(response).to be_success

    expect(result).to eq(600)
  end
end
