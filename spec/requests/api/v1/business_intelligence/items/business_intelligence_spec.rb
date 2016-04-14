require 'rails_helper'

describe "item business intelligence" do
  it "returns the top X amount of items ranked by total revenue" do
    create_3_invoiced_items
    item = Item.last

    get "/api/v1/items/most_revenue?quantity=2"
    results = JSON.parse(response.body)

    expect(response).to be_success
    highest_item = Item.find(results.first["id"])

    expect(results.length).to eq(2)
    expect(highest_item).to eq(Item.last)
  end

  it "returns the top X amount of items ranked by total items" do
    create_3_invoiced_items
    item = Item.last

    get "/api/v1/items/most_items?quantity=2"
    results = JSON.parse(response.body)

    expect(response).to be_success
    
    highest_item = Item.find(results.first["id"])

    expect(results.length).to eq(2)
    expect(highest_item).to eq(Item.last)
  end

  xit "returns the best day for a given item based on invoices" do
    create_3_invoiced_items
    item = Item.last

    get "/api/v1/items/#{item.id}/best_day"
    json = JSON.parse(response.body)

    expect(response).to be_success
    found_day = json["best_day"]

    created_day = Invoice.last.created_at

    expect(found_day).to eq(created_day.to_s)
  end
end


#   GET /api/v1/items/most_revenue?quantity=x returns the top x items ranked by total revenue generated
# GET /api/v1/items/most_items?quantity=x returns the top x item instances ranked by total number sold
# GET /api/v1/items/:id/best_day returns the date with the most sales for the given item using the invoice date
# Customers
