require 'rails_helper'

describe "Customers API" do
  it "find returns a single customer" do
    create_list(:customer, 20)
    customer = Customer.last
    get "/api/v1/customers/find?id=#{customer.id}"

    json = JSON.parse(response.body)
    expect(response).to be_success

    count =
    json.count do | k, v |
      k == "id"
    end

    expect(count).to eq(1)
    expect(json["first_name"]).to eq(Customer.last.first_name)
    expect(json["id"]).to eq(Customer.last.id)
 end
end
