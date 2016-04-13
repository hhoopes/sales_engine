require 'rails_helper'

describe "InvoiceItems API" do
  it "find_all returns multiple invoice_items" do
    5.times do
      create(:invoice_item, quantity: 3)
    end
    2.times do
    create(:invoice_item, quantity: 10)
    end
    invoice_item = InvoiceItem.last

    expect(InvoiceItem.count).to eq(7)

    get "/api/v1/invoice_items/find_all?quantity=#{invoice_item.quantity}"
    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq(2)

    json.each do | result |
      expect(result["quantity"]).to eq(invoice_item.quantity)
    end
  end
end
