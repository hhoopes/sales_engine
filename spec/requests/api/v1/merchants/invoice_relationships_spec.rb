require 'rails_helper'

describe "Merchants relationships API endpoints" do
  it "returns all invoices for a merchant" do
    create_list(:merchant_with_invoices, 3)

    expect(Invoice.count).to eq(9)
    expect(Merchant.count).to eq(3)

    merchant = Merchant.last
    get "/api/v1/merchants/#{merchant.id}/invoices"

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq(3)

    json.each do | invoice |
      invoices_merchant = Merchant.find(invoice["merchant_id"])
      expect(invoices_merchant).to eq(merchant)
    end
  end
end
