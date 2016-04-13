FactoryGirl.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description
    unit_price Random.rand(99..5000)
    merchant
  end

  sequence :description do |n|
    "descriptive text#{n}"
  end
end
