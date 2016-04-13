require 'rails_helper'

describe "Invoices relationships API endpoints" do
  it "returns all items for an invoice" do
    create_list(:invoice_with_invoice_items, 3)

    expect(Item.count).to eq(9)
    expect(Invoice.count).to eq(3)
    
    invoice = Invoice.last
    get "/api/v1/invoices/#{invoice.id}/items"

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq(3)

    json.each do | item |
      invoice_item = Item.find(item["id"])
      expect(invoice.items).to include(invoice_item)
    end
  end
end
