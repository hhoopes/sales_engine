require 'rails_helper'

describe "Invoices API" do
  it "returns all invoices" do
    create_list(:invoice, 20)
    get '/api/v1/invoices'

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq(20)
    expect(json.last["status"]).to eq(Invoice.last.status)
  end
end
