require 'rails_helper'

describe "InvoiceItems API" do
  it "returns a single invoice_item" do
    create_list(:invoice_item, 3)
    invoice_item = InvoiceItem.last

    get "/api/v1/invoice_items/#{invoice_item.id}"
    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json["quantity"]).to eq(InvoiceItem.last.quantity)
    expect(json["unit_price"]).to eq(InvoiceItem.last.unit_price)
  end
end
