require 'rails_helper'

describe "Customers API" do
  it "returns all customers" do
    create_list(:customer, 20)
    get '/api/v1/customers'

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq(20)
    expect(json.last["first_name"]).to eq(Customer.last.first_name)
    expect(json.last["last_name"]).to eq(Customer.last.last_name)
  end
end
