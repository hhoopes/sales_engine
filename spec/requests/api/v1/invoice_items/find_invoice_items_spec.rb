require 'rails_helper'

describe "InvoiceItems API" do
  it "find returns a single invoice_item" do
    create_list(:invoice_item, 20)
    invoice_item = InvoiceItem.last
    get "/api/v1/invoice_items/find?id=#{invoice_item.id}"

    json = JSON.parse(response.body)

    expect(response).to be_success

    count =
    json.count do | k, v |
      k == "id"
    end

    expect(count).to eq(1)
    expect(json["unit_price"]).to eq(InvoiceItem.last.unit_price)
    expect(json["id"]).to eq(InvoiceItem.last.id)
 end
end
