require 'rails_helper'

describe "Customers API" do
  it "random returns a single customer" do
    create_list(:customer, 20)
    customer = Customer.last
    get "/api/v1/customers/random"

    json = JSON.parse(response.body)
    expect(response).to be_success

    count =
    json.count do | k, v |
      k == "id"
    end

    expect(count).to eq(1)

  end
end
