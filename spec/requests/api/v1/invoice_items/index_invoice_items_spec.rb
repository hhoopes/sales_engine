require 'rails_helper'

describe "InvoiceItems API" do
  it "returns all invoice_items" do
    create_list(:invoice_item, 20)
    get '/api/v1/invoice_items'

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq(20)
    expect(json.last["quantity"]).to eq(InvoiceItem.last.quantity)
    expect(json.last["unit_price"]).to eq((InvoiceItem.last.unit_price.to_f/100).to_s)
  end
end
