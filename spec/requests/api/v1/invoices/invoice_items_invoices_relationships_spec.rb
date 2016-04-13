require 'rails_helper'

describe "Invoices relationships API endpoints" do
  it "returns all invoice_items for an invoice" do
    create_list(:invoice_with_invoice_items, 3)

    expect(InvoiceItem.count).to eq(9)
    expect(Invoice.count).to eq(3)

    invoice = Invoice.last
    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq(3)

    json.each do | invoice_item |
      invoice_item_invoice = Invoice.find(invoice_item["invoice_id"])
      expect(invoice_item_invoice).to eq(invoice)
    end
  end
end
