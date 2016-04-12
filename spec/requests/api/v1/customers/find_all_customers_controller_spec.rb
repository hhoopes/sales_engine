require 'rails_helper'

describe "Customers API" do
  it "find_all returns multiple customers" do
    create_list(:customer, 5)
    customer = Customer.last

    expect(Customer.count).to eq(5)
    duplicate_merchant = Customer.create(first_name: customer.first_name)
    expect(Customer.count).to eq(6)

    get "/api/v1/customers/find_all?first_name=#{customer.first_name}"
    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq(2)

    json.each do | result |
      expect(result["first_name"]).to eq(Customer.last.first_name)
    end
  end
end
