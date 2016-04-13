FactoryGirl.define do
  factory :invoice_item do
    quantity { Random.rand(1..10) }
    unit_price { Random.rand(99..5000) }
    invoice
    item
  end
end
