FactoryGirl.define do
  factory :item do
    name { Faker::Commerce.product_name }
    sequence(:description)  { |n| "descriptive text #{n}}" }
    unit_price Random.rand(99..5000)
    merchant
  end
end
