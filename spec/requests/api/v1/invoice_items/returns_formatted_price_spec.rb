require 'rails_helper'

describe "InvoiceItems API" do
  it "returns a formatted unit price" do
    create_list(:invoice_item, 3)
    invoice_item = InvoiceItem.last
    unit_price = invoice_item.unit_price
    formatted_price = unit_price.to_f/100

    get "/api/v1/invoice_items/#{invoice_item.id}"
    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json["formatted_price"]).to eq(formatted_price)
  end
end
