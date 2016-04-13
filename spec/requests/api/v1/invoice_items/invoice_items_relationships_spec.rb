require 'rails_helper'

describe "Invoice_items relationships API endpoints" do
  it "returns the invoice associated with an invoice_item" do
    create_list(:invoice_item, 3)

    invoice_item = InvoiceItem.last
    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    json = JSON.parse(response.body)

    expect(response).to be_success

    invoice = Invoice.find(json["id"])
    expect(invoice).to eq(invoice_item.invoice)
  end

  it "returns the item associated with an invoice_item" do
    create_list(:invoice_item, 3)

    invoice_item = InvoiceItem.last
    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    json = JSON.parse(response.body)

    expect(response).to be_success

    item = Item.find(json["id"])
    expect(item).to eq(invoice_item.item)
  end
end
