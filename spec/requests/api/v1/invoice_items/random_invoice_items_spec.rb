require 'rails_helper'

describe "InvoiceItems API" do
  it "random returns a single invoice_item" do
    create_list(:invoice_item, 20)

    get "/api/v1/invoice_items/random"

    json = JSON.parse(response.body)
    expect(response).to be_success

    count =
    json.count do | k, v |
      k == "id"
    end

    expect(count).to eq(1)

    match = InvoiceItem.find_by(unit_price: json["unit_price"])
    expect(match).to be_a_kind_of(InvoiceItem)

    expect(json["unit_price"]).to be_a_kind_of(Integer)
  end
end
