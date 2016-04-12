require 'rails_helper'

describe "Customers API" do
  it "returns a single customer" do
    create_list(:customer, 3)
    customer = Customer.last

    get "/api/v1/customers/#{customer.id}"
    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json["first_name"]).to eq(Customer.last.first_name)
  end
end
